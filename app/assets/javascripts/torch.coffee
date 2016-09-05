class @Torch
  constructor: (x, y, radius) ->
    @x          = x
    @y          = y
    @radius     = radius
    @isOn       = false

  turnOn: ->
    if !@isOn
      this._log 'turning on'
      @isOn = true

  turnOff: ->
    if @isOn
      this._log 'turning off'
      @isOn = false

  touches: (otherTorch) =>
    return this._distance(otherTorch) < @radius + otherTorch.radius

  _distance: (otherTorch) =>
    dx = otherTorch.x - @x
    dy = otherTorch.y - @y
    return Math.sqrt(dx * dx + dy * dy)

  _log: (message) =>
    console.log(@x + "," + @y + ": " + message);
