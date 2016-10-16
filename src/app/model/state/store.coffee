{rootReducer} = require './reducers'
{createStore, applyMiddleware} = require 'redux'

{requestMiddleware} = require './middleware'

exports.initializeStore = ->
  store = createStore rootReducer, applyMiddleware(requestMiddleware)
