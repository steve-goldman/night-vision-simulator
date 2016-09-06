class @MessageLogger
  constructor: (ulId) ->
    @ul = $(ulId)

  log: (message) =>
    console.log 'logging something'
    @ul.prepend this._logLine(message)

  _logLine: (message) =>
    return '<li class="list-group-item">' + message.timestamp + ':' + message.name + ' = ' + message.data + '</li>'
