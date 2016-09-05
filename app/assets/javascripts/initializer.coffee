class @Initializer
  initialize: =>
    console.log 'Initializer.initialize'

    parameters   = new Parameters()
    context      = document.getElementById('canvas').getContext('2d')
    torchBuilder = new TorchBuilder 640, 480, 5, context, parameters
    torchManager = new TorchManager torchBuilder

    new FrequencyWatcher(parameters.setFrequency)
    new ProbabilityWatcher(parameters.setProbability)
    new DutyCycleWatcher(parameters.setDutyCycle)
    new TorchCountWatcher(torchManager.setTorchCount)
