class @Torch
  constructor: (x, y, radius, parameters) ->
    @x          = x
    @y          = y
    @radius     = radius
    @parameters = parameters

  start: =>
    this._log 'starting'
    
  stop: =>
    this._log 'stopping'

  touches: (otherTorch) =>
    return this._distance(otherTorch) < @radius + otherTorch.radius

  _distance: (otherTorch) =>
    dx = otherTorch.x - @x
    dy = otherTorch.y - @y
    return Math.sqrt(dx * dx + dy * dy)

  _log: (message) =>
    console.log(@x + "," + @y + ": " + message);
