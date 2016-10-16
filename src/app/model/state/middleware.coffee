creators = require '../actions/creators'
types    = require '../actions/types'

require 'isomorphic-fetch'

host = "http://54.244.175.192:8080/"

exports.requestMiddleware = (store) -> (next) -> (action) ->
  switch action.type
    when types.LOAD_SUBREDDIT.REQUEST
      method = 'GET'
      url = "#{host}/subreddit/#{action.name}"
      success = creators.successSubreddit
      failure = creators.failureSubreddit
      body = {}

  opts =
    method: method
    credentials: 'include'
    mode: 'cors'
    cache: 'default'
    body: body
    headers:
      "Content-Type": "application/json"

  fetch url, opts
    .then (response) -> response.json()
    .then (json) ->
      store.dispatch success(json)
    .catch (err) ->
      store.dispatch failure(err)

  next(action)
