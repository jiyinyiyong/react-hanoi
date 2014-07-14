
oop = require './utils/oop'
Dispatcher = require './utils/dispatcher'

store =
  a: [1..12]
  b: []
  c: []

module.exports = model = new Dispatcher

oop.mixin model,

  get: ->
    store

  move: (n, fromStack, toStack) ->
    if fromStack isnt toStack
      placeHead = store[toStack][0]
      if placeHead?
        if placeHead < n
          return
      store[fromStack].shift()
      store[toStack].unshift n
      @emit()