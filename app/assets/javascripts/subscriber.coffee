class @Subscriber
  constructor: (channel, frequencyCallback, probabilityCallback, dutyCycleCallback) ->
    channel.subscribe this._onMessage
    @frequencyCallback   = frequencyCallback
    @probabilityCallback = probabilityCallback
    @dutyCycleCallback   = dutyCycleCallback

  _onMessage: (message) =>
    switch message.name
      when 'frequency'   then @frequencyCallback   message.data
      when 'probability' then @probabilityCallback message.data
      when 'dutyCycle'   then @dutyCycleCallback   message.data
