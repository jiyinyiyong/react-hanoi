
module.exports = React.createClass
  dispayName: 'disk'

  onDragStart: ->
    @props.setDraggingStack()

  onDragEnd: ->
    @props.unsetDraggingStack()

  render: ->

    draggable = @props.index is 0

    $.div
      className: $$.concat 'disk',
        if draggable then 'is-draggable'
      draggable: draggable
      onDragStart: @onDragStart
      onDragEnd: @onDragEnd
      style:
        width: "#{@props.n * 20}px"