class @Subscriber
  constructor: (channel, logger, frequencyCallback, probabilityCallback, dutyCycleCallback) ->
    channel.subscribe this._onMessage
    @logger              = logger
    @frequencyCallback   = frequencyCallback
    @probabilityCallback = probabilityCallback
    @dutyCycleCallback   = dutyCycleCallback

  _onMessage: (message) =>
    @logger.log message
    switch message.name
      when 'frequency'   then @frequencyCallback   message.data
      when 'probability' then @probabilityCallback message.data
      when 'dutyCycle'   then @dutyCycleCallback   message.data
