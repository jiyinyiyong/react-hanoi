
StackComp = require './stack'
model = require '../model'

module.exports = React.createClass
  displayName: 'hanoi'

  getInitialState: ->
    draggingStack: null

  onDrop: (n) ->
    model.move n, @state.fromStack, @state.toStack

  setDraggingStack: (n) ->
    @setState draggingStack: n

  render: ->
    store = model.get()
    console.log "draggingStack start: #{@state.draggingStack}"

    stacks = ['a', 'b', 'c'].map (name) =>
      StackComp
        name: name
        key: name
        disks: store
        setDraggingStack: @setDraggingStack
        draggingStack: @state.draggingStack

    $.div
      className: 'hanoi row-strech'
      stacks