class @FrequencyWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#frequency-label', '#frequency-input', "Frequency (ms) = ", callback

class @ProbabilityWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#probability-label', '#probability-input', "Probability (%) = ", callback

class @DutyCycleWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#duty-cycle-label', '#duty-cycle-input', "Duty Cycle (%) = ", callback

class @TorchCountWatcher extends SliderWatcher
  constructor: (callback) ->
    super '#torch-count-label', '#torch-count-input', "Torch Count = ", callback
