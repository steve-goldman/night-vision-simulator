class @Publisher
  constructor: (channel) ->
    @channel    = channel
    @parameters = new Parameters()

  sendFrequency: (frequency) =>
    console.log('received frequency=' + frequency)
    @parameters.setFrequency frequency
    this._sendFrequency()

  sendProbability: (probability) =>
    console.log('received probability=' + probability)
    @parameters.setProbability probability
    this._sendProbability()

  sendDutyCycle: (dutyCycle) =>
    console.log('received dutyCycle=' + dutyCycle)
    @parameters.setDutyCycle dutyCycle
    this._sendDutyCycle()

  sendAll: =>
    this._sendFrequency()
    this._sendProbability()
    this._sendDutyCycle()

  _sendFrequency: =>
    @channel.publish 'frequency', @parameters.frequency, this._handleError

  _sendProbability: =>
    @channel.publish 'probability', @parameters.probability, this._handleError

  _sendDutyCycle: =>
    @channel.publish 'dutyCycle', @parameters.dutyCycle, this._handleError

  _handleError: (err) =>
    if err
      console.log 'unable to publish message due to: ' + err.message
    else
      console.log 'published successfully'
