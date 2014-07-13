
DiskComp = require './disk'

model = require '../model'

module.exports = React.createClass
  displayName: 'stack'

  render: ->
    disks = []
    for n, index in @props.disks
      disks.push (DiskComp n: n, key: n, index: index)
    $.div
      className: $$.concat 'stack flex-fill column-end',
        if @props.id is model.getDropping() then 'dropping'
      onDragStart: (event) =>
        model.setFrom @props.id
      onDragEnter: (event) =>
        model.setDropping @props.id
      onDrop: (event) =>
        console.log 'drop', event
        model.setDropping ''
      disks