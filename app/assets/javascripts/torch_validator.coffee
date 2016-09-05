class @TorchValidator
  constructor: (torches) ->
    @torches = torches

  isValid: (torchCandidate) =>
    for torch in @torches
      if this._touches torch, torchCandidate
        return false
    return true

  _touches: (torchA, torchB) =>
    return this._distance(torchA, torchB) < torchA.radius + torchB.radius

  _distance: (torchA, torchB) =>
    dx = torchB.x - torchA.x
    dy = torchB.y - torchA.y
    return Math.sqrt(dx * dx + dy * dy)
