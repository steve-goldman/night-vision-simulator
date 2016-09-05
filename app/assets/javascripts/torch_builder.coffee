class @TorchBuilder
  constructor: (width, height, radius) ->
    @width      = width
    @height     = height
    @radius     = radius

  buildRandom: () =>
    x = Math.floor(Math.random() * (@width  - 2 * @radius) + @radius)
    y = Math.floor(Math.random() * (@height - 2 * @radius) + @radius)
    return new Torch x, y, @radius
