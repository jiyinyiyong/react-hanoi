
StackComp = require './stack'
model = require '../model'
mixins = require '../utils/mixins'

module.exports = React.createClass
  displayName: 'hanoi'
  mixins: [mixins.listenTo]

  componentDidMount: ->
    @listenTo model, @_onChange

  _onChange: ->
    @setState {}

  render: ->
    store = model.get()
    $.div
      className: 'hanoi row-strech'
      StackComp id: 'a', disks: store.a
      StackComp id: 'b', disks: store.b
      StackComp id: 'c', disks: store.c