class @SliderWatcher
  constructor: (labelId, inputId, prefix, callback) ->
    @label    = $(labelId)
    @input    = $(inputId)
    @prefix   = prefix
    @callback = callback
  
    @input.on 'input', => this._updateLabel()
    @input.change      => this._updateListener()

    this._updateLabel()
    this._updateListener()

  _updateLabel: =>
    @label.html(@prefix + this._getValue())
    
  _updateListener: =>
    @callback this._getValue()
  
  _getValue: =>
    return @input.val()
