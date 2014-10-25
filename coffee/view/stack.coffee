
DiskComp = require './disk'
store = require '../model'

module.exports = React.createClass
  displayName: 'stack'

  getInitialState: ->
    hover: no

  onDragStart: (event) ->
    event.dataTransfer
    @props.setDraggingStack @props.name

  onDragOver: (event) ->
    @dealWithPermission =>
      event.preventDefault()

  dealWithPermission: (cb) ->
    from = @props.disks[@props.draggingStack]
    too = @props.disks[@props.name]
    if @props.draggingStack is @props.name
      return
    fromTop = from[0]
    toTop = too[0]
    unless fromTop?
      return
    if toTop?
      if fromTop < toTop
        cb()
    else
      cb()

  onDragEnter: (event) ->
    @dealWithPermission =>
      @setState hover: yes

  onDragLeave: (event) ->
    @setState hover: no

  onDrop: (event) ->
    @setState hover: no
    @props.setDraggingStack null
    store.move @props.draggingStack, @props.name

  setDraggingStack: ->
    @props.setDraggingStack @props.name

  unsetDraggingStack: ->
    @props.setDraggingStack null

  render: ->
    disks = @props.disks[@props.name].map (n, index) =>
      DiskComp
        n: n
        key: n
        index: index
        setDraggingStack: @setDraggingStack
        unsetDraggingStack: @unsetDraggingStack

    $.div
      className: $$.concat 'stack flex-fill column-end',
        if @state.hover then 'dropping'
      onDragOver: @onDragOver
      onDragEnter: @onDragEnter
      onDragLeave: @onDragLeave
      onDrop: @onDrop
      disks