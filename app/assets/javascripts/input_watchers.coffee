class @FrequencyWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#frequency-label', '#frequency-input', "Frequency (ms) = ", callback

class @ProbabilityWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#probability-label', '#probability-input', "Probability (%) = ", callback

class @DutyCycleWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#duty-cycle-label', '#duty-cycle-input', "Duty Cycle (%) = ", callback

class @TorchCountWatcher
  constructor: (callback, max) ->
    @callback   = callback
    @max        = max
    @label      = $('#torch-count-label')
    @numTorches = 0
      
    $('#minus-torch-button').click => this._minusTorch()
    $('#plus-torch-button').click => this._plusTorch()

    this._update()

  _minusTorch: =>
    if @numTorches > 0
      @numTorches--
      this._update()

  _plusTorch: =>
    if @numTorches < @max
      @numTorches++
      this._update()

  _update: =>
    @label.html @numTorches
    @callback @numTorches
