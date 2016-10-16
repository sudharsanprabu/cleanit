React    = require 'react'
ReactDom = require 'react-dom'

{Router, hashHistory} = require 'react-router'
{Provider} = require 'react-redux'

injectTapEvenPlugin = require 'react-tap-event-plugin'

AppRoutes = require './AppRoutes'
{initializeStore} = require './model/state/store'

injectTapEvenPlugin()

store = initializeStore()

ReactDom.render(
  <Provider store={store}>
    <Router
      history={hashHistory}
      onUpdate={-> window.scrollTo(0, 0)}
    >
      {AppRoutes}
    </Router>
  </Provider>
, document.getElementById('app'))
