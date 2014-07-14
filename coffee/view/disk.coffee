
module.exports = React.createClass
  dispayName: 'disk'

  render: ->

    $.div
      className: 'disk'
      draggable: (@props.index is 0)
      onDragStart: (event) =>
      onDragEnd: (event) =>
        @props.move @props.n

      style:
        width: "#{@props.n * 20}px"
