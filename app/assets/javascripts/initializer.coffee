class @Initializer
  initialize: =>
    console.log 'Initializer.initialize'
    new FrequencyWatcher(this.onFrequency)
    new ProbabilityWatcher(this.onProbability)
    new DutyCycleWatcher(this.onDutyCycle)
    new TorchCountWatcher(this.onTorchCount, 20)
  
  onFrequency: (frequency) =>
    console.log("onFrequency: " + frequency)

  onProbability: (probability) =>
    console.log("onProbability: " + probability)

  onDutyCycle: (dutyCycle) =>
    console.log("onDutyCycle: " + dutyCycle)

  onTorchCount: (torchCount) =>
    console.log("onTorchCount: " + torchCount)
