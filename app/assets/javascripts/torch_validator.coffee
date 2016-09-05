class @TorchValidator
  constructor: (torches) ->
    @torches = torches

  isValid: (torchCandidate) =>
    for torch in @torches
      if torch.touches torchCandidate
        return false
    return true
