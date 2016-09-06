class @TorchInitializer
  initialize: =>
    console.log 'TorchInitializer.initialize'

    parameters   = new Parameters()
    context      = document.getElementById('canvas').getContext('2d')
    torch        = new Torch 320, 240, 100, context, parameters
    torchStarter = new TorchStarter parameters, torch
    ably         = new Ably.Realtime 'GwpT7g.Y3x0yA:O3g2LQ8uek306Ecf'
    channel      = ably.channels.get 'night-vision:prototype'
    subscriber   = new Subscriber channel, torchStarter.setFrequency, torchStarter.setProbability, torchStarter.setDutyCycle 
