React = require 'react'

pageStyle =
  padding:   "20px"
  textAlign: "center"

module.exports =
class NotFound extends React.Component
  constructor: (props) ->
    super props

  render: ->
    <div style={pageStyle}>
      <h1>404... This page was not found!</h1>
    </div>
