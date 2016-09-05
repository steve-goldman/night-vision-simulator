class @ValidTorchBuilder
  constructor: (torchBuilder, torchValidator) ->
    @torchBuilder   = torchBuilder
    @torchValidator = torchValidator

  buildValid: ->
    i     = 0
    torch = @torchBuilder.buildRandom()
    while !@torchValidator.isValid torch
      if ++i > 1000
        return null
      torch = @torchBuilder.buildRandom()
    return torch
