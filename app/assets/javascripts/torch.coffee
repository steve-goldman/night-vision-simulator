class @Torch
  BRIGHT        = "#D6D1A0"
  DIM           = "#351465"
  OFF           = "#260656"

  constructor: (x, y, radius, context) ->
    @x          = x
    @y          = y
    @radius     = radius
    @context    = context

  open: =>
    this._turnOff(DIM)

  close: =>
    this._turnOff(OFF)

  turnOn: =>
    if !@isOn
      this._turnOn()

  turnOff: =>
    if @isOn
      this._turnOff(DIM)

  touches: (otherTorch) =>
    return this._distance(otherTorch) < @radius + otherTorch.radius

  _turnOn: =>
    this._draw(@radius, BRIGHT, DIM)
    @isOn = true

  _turnOff: (fillStyle) =>
    this._draw(@radius + 1, fillStyle)
    @isOn = false

  _distance: (otherTorch) =>
    dx = otherTorch.x - @x
    dy = otherTorch.y - @y
    return Math.sqrt(dx * dx + dy * dy)

  _draw: (radius, fillStyle) =>
    @context.beginPath(radius)
    @context.arc @x, @y, radius, 0, 2 * Math.PI
    @context.fillStyle = fillStyle
    @context.fill()

  _log: (message) =>
    console.log(@x + "," + @y + ": " + message)
