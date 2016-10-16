initialState = require './store'
types        = require '../actions/types'
transitions  = require '../actions/transitions'

{combineReducers} = require 'redux-immutable'
{List, Map}       = require 'immutable'

# State model
initialState = Map
  isFetching: false
  info: {}
  posts: List()

postsReducer = (state=initialState, action) ->
  switch action.type
    when types.LOAD_SUBREDDIT.REQUEST
      transitions.setSubredditRequest state

    when types.LOAD_SUBREDDIT.SUCCESS
      transitions.setSubredditSuccess state, action.posts

    when types.LOAD_SUBREDDIT.FAILURE
      transitions.setSubredditFailure state, action.error
  
exports.rootReducer = postsReducer
