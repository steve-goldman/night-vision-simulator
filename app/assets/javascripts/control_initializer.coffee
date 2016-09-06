class @ControlInitializer
  initialize: =>
    console.log 'ControlInitializer.initialize'

    restAbly     = new Ably.Rest 'GwpT7g.804CmA:7vU7Dhizpj8Glzs5'
    channel      = restAbly.channels.get 'night-vision:prototype'
    publisher    = new Publisher channel

    new FrequencyWatcher(publisher.sendFrequency)
    new ProbabilityWatcher(publisher.sendProbability)
    new DutyCycleWatcher(publisher.sendDutyCycle)
