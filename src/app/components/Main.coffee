React = require 'react'

MuiThemeProvider = require('material-ui/styles/MuiThemeProvider').default
getMuiTheme      = require('material-ui/styles/getMuiTheme').default

AppBar    = require('material-ui/AppBar').default
AppNavBar = require './AppNavBar'

{green500, red500} = require('material-ui/styles/colors')

muiTheme = getMuiTheme
  palette:
    primary1Color: green500
    secondary1Color: red500

module.exports =
class Main extends React.Component
  constructor: (props) ->
    super props
    @state =
      appNavBarOpen: false

  @contextTypes:
    router: React.PropTypes.object.isRequired

  handleToggle: =>
    @setState
      appNavBarOpen: not @state.appNavBarOpen

  render: ->
    {children} = @props

    <MuiThemeProvider muiTheme={muiTheme}>
      <div>
        <AppBar
          onLeftIconButtonTouchTap={@handleToggle}
        />

        <AppNavBar
          open={@state.appNavBarOpen}
          handleToggle={@handleToggle}
        />

        {children}

      </div>
    </MuiThemeProvider>
