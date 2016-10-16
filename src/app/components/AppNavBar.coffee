React = require 'react'

Drawer = require('material-ui/Drawer').default

{List, ListItem} = require('material-ui/List')

{green500} = require('material-ui/styles/colors')
{spacing, typography, zIndex} = require 'material-ui/styles'

logoStyle =
  cursor: 'pointer'
  fontSize: 24
  color: typography.textFullWhite
  lineHeight: spacing.desktopKeylineIncrement + "px"
  fontWeight: typography.fontWeightLight
  backgroundColor: green500
  paddingLeft: spacing.desktopGutter
  marginBottom: 8

module.exports =
class AppNavBar extends React.Component
  constructor: (props) ->
    super props

  @contextTypes:
    router: React.PropTypes.object.isRequired

  handleToggleOff: =>
    @context.router.push '/'
    @props.handleToggle()

  render: ->
    {open, handleToggle} = @props

    <Drawer
      open={open}
      docked={false}
      containerStyle={{zIndex: zIndex.drawer - 100}}
    >
      <div
        style={logoStyle}
        onTouchTap={@handleToggleOff}
      >
        re-eddit
      </div>

    </Drawer>
