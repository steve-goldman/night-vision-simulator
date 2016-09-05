class @TorchManager
  constructor: (torchBuilder, parameters) ->
    @torches           = []
    @validTorchBuilder = new ValidTorchBuilder torchBuilder, new TorchValidator(@torches)
    @parameters        = parameters

  setTorchCount: (torchCount) =>
    while @torches.length > torchCount
      @torches.pop().close()
    while @torches.length < torchCount
      @torches.push @validTorchBuilder.buildValid()

  start: =>
    this._startCycle()

  _startCycle: =>
    for torch in @torches
      this._possiblyTurnOnTorch torch

    setTimeout this._dutyCycle,  @parameters.dutyCycle * @parameters.frequency / 100.0
    setTimeout this._startCycle, @parameters.frequency

  _dutyCycle: =>
    for torch in @torches
      torch.turnOff()

  _possiblyTurnOnTorch: (torch) =>
    if Math.random() < @parameters.probability / 100.0
      torch.turnOn()
