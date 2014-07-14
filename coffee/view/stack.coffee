
DiskComp = require './disk'

module.exports = React.createClass
  displayName: 'stack'

  getInitialState: ->
    dragging: null

  render: ->
    disks = @props.disks.map (n, index) =>
      DiskComp n: n, key: n, index: index, move: @props.move

    $.div
      className: $$.concat 'stack flex-fill column-end',
        if @props.atHover then 'dropping'
      onDragStart: (event) =>
        @props.setFrom @props.id
      onDragEnter: (event) =>
        @props.setTo @props.id
      onDragEnd: (event) =>
        @props.setTo null
      disks