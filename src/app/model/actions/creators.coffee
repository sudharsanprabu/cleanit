types = require './types'

exports.requestSubreddit = (subreddit) ->
  type: types.LOAD_SUBREDDIT_REQUEST
  name: subreddit

exports.successSubreddit = (posts) ->
  type: types.LOAD_SUBREDDIT_SUCCESS
  posts: posts

exports.failureSubreddit = (error) ->
  type: types.LOAD_SUBREDDIT_FAILURE
  error: error
