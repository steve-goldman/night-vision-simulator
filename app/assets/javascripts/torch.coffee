class @Torch
  BRIGHT        = "#D6D1A0"
  DIM           = "#351465"

  constructor: (x, y, radius, context) ->
    @x          = x
    @y          = y
    @radius     = radius
    @context    = context
    @isOn       = true
    this.turnOff()

  turnOn: =>
    if !@isOn
      this._log 'turning on'
      this._draw BRIGHT, DIM
      @isOn = true

  turnOff: =>
    if @isOn
      this._log 'turning off'
      this._draw DIM, DIM
      @isOn = false

  close: =>
    this._log 'closing'

  touches: (otherTorch) =>
    this._log 'distance is ' + this._distance(otherTorch)
    return this._distance(otherTorch) < @radius + otherTorch.radius

  _distance: (otherTorch) =>
    dx = otherTorch.x - @x
    dy = otherTorch.y - @y
    return Math.sqrt(dx * dx + dy * dy)

  _draw: (fillStyle) =>
    @context.beginPath()
    @context.arc @x, @y, @radius, 0, 2 * Math.PI
    @context.fillStyle = fillStyle
    @context.fill()

  _makePath: =>
    @context.rect @x - @radius, @y - @radius, 2 * @radius, 2 * @radius

  _log: (message) =>
    console.log(@x + "," + @y + ": " + message)
