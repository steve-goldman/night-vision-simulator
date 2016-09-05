class @TorchManager
  constructor: (torchBuilder) ->
    @torches           = []
    @validTorchBuilder = new ValidTorchBuilder torchBuilder, new TorchValidator(@torches)

  setTorchCount: (torchCount) =>
    while @torches.length > torchCount
      @torches.pop().close()
    while @torches.length < torchCount
      @torches.push @validTorchBuilder.buildValid()
