class @Torch
  constructor: (x, y, radius, parameters) ->
    @x          = x
    @y          = y
    @radius     = radius
    @parameters = parameters
    @open       = true

  start: =>
    this._nextCycle()

  stop: =>
    this._log 'stopping'
    @open = false

  touches: (otherTorch) =>
    return this._distance(otherTorch) < @radius + otherTorch.radius

  _nextCycle: =>
    if @open
      r = Math.random()
      @isOn = Math.random() < @parameters.probability / 100.0
      this._log 'starting cycle isOn=' + @isOn
      setTimeout this._nextCycle, @parameters.frequency

  _distance: (otherTorch) =>
    dx = otherTorch.x - @x
    dy = otherTorch.y - @y
    return Math.sqrt(dx * dx + dy * dy)

  _log: (message) =>
    console.log(@x + "," + @y + ": " + message);
