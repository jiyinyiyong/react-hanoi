
model = require '../model'

module.exports = React.createClass
  dispayName: 'disk'

  render: ->

    $.div
      className: 'disk'
      draggable: (@props.index is 0)
      onDragStart: (event) =>
      onDragEnd: (event) =>
        model.move @props.n

      style:
        width: "#{@props.n * 20}px"
