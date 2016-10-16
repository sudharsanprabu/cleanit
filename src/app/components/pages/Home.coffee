React = require 'react'
Title = require('react-title-component').default
TextField = require('material-ui/TextField').default
RaisedButton = require('material-ui/RaisedButton').default

module.exports =
class Home extends React.Component
  constructor: (props) ->
    super props

  handleSearch: () =>


  render: ->
    onEnter = ->

    <div style={{textAlign: "center", marginTop: "2em"}}>
      <Title render="Home" />
      <p style={{fontSize: "36pt"}}>re-edit</p>
      <TextField
        style={{paddingTop: "100px"}}
        hintText="enter a subreddit name ..."
      /><br />
      <RaisedButton label="Search" primary={true} style={{marginTop: "50px"}}/>
    </div>
