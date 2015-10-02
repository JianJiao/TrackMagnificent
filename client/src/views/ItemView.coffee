class ItemView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change:completed', @onCompletedChange

  onCompletedChange: ->
    if @model.get 'completed'
      @remove()


  events: ->
    'click .done': 'onDone'

  onDone: ->
    @model.done()

  render: ->
    template = require '../../templates/item.tmpl.hbs'
    # console.log @model
    html = template @model.toJSON()
    # console.log html
    @$el.append html
    @

module.exports = ItemView