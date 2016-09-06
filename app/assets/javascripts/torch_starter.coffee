class @TorchStarter
  constructor: (parameters, torch) ->
    @parameters = parameters
    @torch      = torch
    @started    = false

  setFrequency: (frequency) =>
    @parameters.setFrequency frequency
    this._checkStartTorch()

  setProbability: (probability) =>
    @parameters.setProbability probability
    this._checkStartTorch()

  setDutyCycle: (dutyCycle) =>
    @parameters.setDutyCycle dutyCycle
    this._checkStartTorch()

  _checkStartTorch: =>
    if !@started && @parameters.allValid()
      @torch.open()
      @started = true;
