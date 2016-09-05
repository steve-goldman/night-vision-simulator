class @Torch
  constructor: (x, y, radius, parameters) ->
    @x          = x
    @y          = y
    @radius     = radius
    @parameters = parameters
    this.start()

  start: =>
    this._log 'starting'
    
  stop: =>
    this._log 'stopping'

  _log: (message) =>
    console.log(@x + "," + @y + ": " + message);
