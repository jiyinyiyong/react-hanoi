
store =
  a: [1..12]
  b: []
  c: []

exports.get = ->
  store

exports.move = (from, too) ->
  if from isnt too
    if store[from][0]?
      n = store[from].shift()
      store[too].unshift n
      @emit()