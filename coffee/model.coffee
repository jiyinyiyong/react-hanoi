
oop = require './utils/oop'
Dispatcher = require './utils/dispatcher'

store =
  a: [1..12]
  b: []
  c: []
  from: null
  dropping: null

module.exports = model = new Dispatcher

oop.mixin model,

  get: ->
    store

  setFrom: (id) ->
    store.from = id

  setDragging: (id) ->
    store.dragging = id

  setDropping: (id) ->
    store.dropping = id
    @emit()

  getDropping: ->
    store.dropping

  move: (n) ->
    if store.dropping?
      if store.dropping isnt store.from
        console.log store
        store[store.from].shift()
        store[store.dropping].unshift n
        store.dropping = null
        store.from = null
        @emit()