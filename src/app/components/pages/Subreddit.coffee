creators = require '../../model/actions/creators'

React            = require 'react'
PureRenderMixin  = require 'react-addons-pure-render-mixin'
RaisedButton     = require('material-ui/RaisedButton').default
CircularProgress = require('material-ui/CircularProgress').default

{ connect }        = require 'react-redux'
{ List, ListItem } = require 'material-ui/List'

{ green300, grey50 }    = require 'material-ui/styles/colors'
{ spacing, typography, zIndex } = require 'material-ui/styles'

Title = require('react-title-component').default

leftHeaderStyle =
  width: "75%"
  float: "left"
  color: green300

rightHeaderStyle =
  color: green300

loadingStyle =
  textAlign: "center"
  padding: "20px"
  marginTop: "50px"

listStyle =
  height: "75px"
  borderTop: "1px solid #eee"

listItemStyle =
  width: "75%"
  float: "left"

pageStyle =
  marginBottom: "15px"
  marginTop: "15px"
  padding: "0 15px"

class Subreddit extends React.Component
  constructor: (props) ->
    super props

  mixins: [PureRenderMixin]

  @contextTypes:
    store: React.PropTypes.object

  componentDidMount: ->
    @context.store.dispatch creators.requestSubreddit()

  render: ->
    unless @props.posts.get 'isFetching'
      <div style={pageStyle}>
        <Title render="Posts" />

        <List>
          <ListItem
            disabled={true}
          >
            <div>
              <div style={leftHeaderStyle}>Posts</div>
            </div>
          </ListItem>

          {
            @props.posts.map (entry) ->
              <ListItem
                value={entry.id}
                key={entry.id}
                href="#/subreddit/#{entry.id}"
                style={listStyle}
              >
                <div>
                  <div style={listItemStyle}>{entry.title}</div>
                </div>
              </ListItem>
          }

        </List>
      </div>
    else
      <div style={loadingStyle}>
        <CircularProgress size={2} />
      </div>

mapStateToProps = (state) ->
  posts: state.get 'posts'

module.exports = connect(mapStateToProps)(Subreddit)
