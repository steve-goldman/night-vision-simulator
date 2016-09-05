class @Torch
  BRIGHT        = "#D6D1A0"
  DIM           = "#351465"
  OFF           = "#260656"

  constructor: (x, y, radius, context, parameters) ->
    @x          = x
    @y          = y
    @radius     = radius
    @context    = context
    @parameters = parameters
    @isClosed   = false

  open: =>
    this._turnOff(DIM)
    setTimeout this._startCycle, Math.random() * @parameters.frequency

  close: =>
    this._turnOff(OFF)
    @isClosed = true

  _startCycle: =>
    if !@isClosed
      isOn = Math.random() < @parameters.probability / 100.0
      if isOn
        this._turnOn()
        setTimeout this._dutyCycle, @parameters.dutyCycle * @parameters.frequency / 100.0
      setTimeout this._startCycle, @parameters.frequency

  _dutyCycle: =>
    if !@isClosed
      this._turnOff(DIM)

  _turnOn: =>
    this._draw(@radius, BRIGHT, DIM)

  _turnOff: (fillStyle) =>
    this._draw(@radius + 1, fillStyle)

  _draw: (radius, fillStyle) =>
    @context.beginPath(radius)
    @context.arc @x, @y, radius, 0, 2 * Math.PI
    @context.fillStyle = fillStyle
    @context.fill()
