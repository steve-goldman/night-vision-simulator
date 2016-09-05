class @TorchManager
  constructor: (torchBuilder) ->
    @torches           = []
    torchValidator     = new TorchValidator @torches
    @validTorchBuilder = new ValidTorchBuilder torchBuilder, torchValidator
    
  setTorchCount: (torchCount) =>
    while @torches.length > torchCount
      @torches.pop().stop()
    while @torches.length < torchCount
      @torches.push this._buildAndStartTorch()

  _buildAndStartTorch: =>
    torch = @validTorchBuilder.buildValid()
    torch.start()
    return torch
