
StackComp = require './stack'
model = require '../model'
mixins = require '../utils/mixins'

module.exports = React.createClass
  displayName: 'hanoi'
  mixins: [mixins.listenTo]

  getInitialState: ->
    fromStack: null
    toStack: null

  componentDidMount: ->
    @listenTo model, @_onChange

  _onChange: ->
    @setState {}

  setFrom: (name) ->
    @setState fromStack: name

  setTo: (name) ->
    @setState toStack: name

  move: (n) ->
    model.move n, @state.fromStack, @state.toStack

  render: ->
    store = model.get()

    stacks = ['a', 'b', 'c'].map (name) =>
      StackComp
        id: name
        key: name
        disks: store[name]
        atHover: name is @state.toStack
        setFrom: @setFrom
        setTo: @setTo
        move: @move

    $.div
      className: 'hanoi row-strech'
      stacks