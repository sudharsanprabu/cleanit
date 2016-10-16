# Gulp file written in coffeescript to set up auto-reloading for file edits.
# UI file changes are shown immediately on the browser after saving the files.

gulp        = require 'gulp'
browserify  = require 'browserify'
browserSync = require 'browser-sync'
watchify    = require 'watchify'
source      = require 'vinyl-source-stream'
creactify   = require 'coffee-reactify'
streamify   = require 'gulp-streamify'
uglify      = require 'gulp-uglify'
envify      = require 'loose-envify/custom'

src =
  entry: './src/app/app.coffee'
  markup: './src/www/**'

images  = './images/**'
dest    = './build'
imgDest = dest + '/images'

prodEnv =
  NODE_ENV: "production"

# Bundle all coffeescript files into a single js file in the build folder.
# Automatically rebundle whenever a coffeescript file is edited.
gulp.task 'browserifyDev', [ 'setWatch' ], ->
  bundle = browserify
    cache: {}
    packageCache: {}
    plugin: [ watchify ]
    transform: [ creactify ]
    entries: src.entry
    extensions: [ '.coffee', '.cjsx' ]
    debug: true

  makeBundle = ->
    bundle
      .bundle()
      .pipe source('bundle.js')
      .pipe gulp.dest(dest)

  bundle.on 'update', makeBundle
  makeBundle()

gulp.task 'browserifyProd', ->
  bundle = browserify
    cache: {}
    packageCache: {}
    transform: [ creactify, envify(prodEnv) ]
    entries: src.entry
    extensions: [ '.coffee', '.cjsx' ]
    debug: false

  makeBundle = ->
    bundle
      .bundle()
      .pipe source('bundle.js')
      .pipe streamify(uglify())
      .pipe gulp.dest(dest)

  makeBundle()

# Sync changes to website files in src/www to files in build.
gulp.task 'browserSync', [ 'build' ], ->
  browserSync.init null,
    open: true
    server:
      baseDir: [ dest, src.markup ]
    files: [ dest + '/**' ]
    reloadDelay: 1000 # Prevent white screen of death
    watchOptions:
      debounceDelay: 1000

# Watch for changes to website files in src/www.
gulp.task 'watch', [ 'setWatch', 'browserSync' ], ->
  gulp.watch src.markup, [ 'markup' ]

# Set watching global variable
gulp.task 'setWatch', ->
  global.isWatching = true

# Copy website files in src/www to the build folder.
gulp.task 'markup', ->
  gulp.src(src.markup)
    .pipe gulp.dest(dest)

# Copy images to the build folder.
gulp.task 'images', ->
  gulp.src(images)
    .pipe gulp.dest(imgDest)

# Setup browserify and website file auto-reloads.
gulp.task 'build', [ 'browserifyDev', 'markup', 'images' ]

gulp.task 'ci', [ 'browserifyProd', 'markup', 'images' ]

# Watch for changes as default task.
gulp.task 'default', [ 'watch' ]
