class @Parameters
  setFrequency:     (frequency) => @frequency   = frequency
  setProbability: (probability) => @probability = probability
  setDutyCycle:     (dutyCycle) => @dutyCycle   = dutyCycle

  allValid: =>
    return @frequency != null && @probability != null && @dutyCycle != null
