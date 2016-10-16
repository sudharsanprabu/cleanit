React = require 'react'
{Route, Redirect, IndexRoute} = require 'react-router'

Main = require './components/Main'
Home = require './components/pages/Home'

Subreddit = require './components/pages/Subreddit'

NotFound = require './components/pages/NotFound'

AppRoutes =
  <Route path="/" component={Main}>
    <IndexRoute component={Home} />
    <Route path="home" component={Home} />

  

    <Route path="*" component={NotFound} />
  </Route>

module.exports = AppRoutes
