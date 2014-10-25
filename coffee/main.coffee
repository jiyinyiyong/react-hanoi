
require './utils/extend'

store = require './model'

AppComp = require './view/app'

store.emit = ->
  component = AppComp
    data: store.get()
  React.renderComponent component, document.body

store.emit()