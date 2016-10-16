{ List, Map } = require 'immutable'

exports.setSubredditRequest = (state) ->
  state.set 'isFetching', true

exports.setSubredditSuccess = (state, posts) ->
  state.merge
    isFetching: false
    posts: List posts

exports.setSubredditFailure = (state, error) ->
  state.merge
    isFetching: false
    info: error
