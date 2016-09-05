class @Initializer
  initialize: =>
    console.log 'Initializer.initialize'

    parameters   = new Parameters()
    torchBuilder = new TorchBuilder 640, 480, 10
    torchManager = new TorchManager torchBuilder, parameters

    new FrequencyWatcher(parameters.setFrequency)
    new ProbabilityWatcher(parameters.setProbability)
    new DutyCycleWatcher(parameters.setDutyCycle)
    new TorchCountWatcher(torchManager.setTorchCount, 20)

    torchManager.start()
