class @TorchManager
  constructor: (torchBuilder) ->
    @torchBuilder = torchBuilder
    @torches      = []
    
  setTorchCount: (torchCount) =>
    while @torches.length > torchCount
      @torches.pop().stop()
    while @torches.length < torchCount
      @torches.push @torchBuilder.buildRandom()
