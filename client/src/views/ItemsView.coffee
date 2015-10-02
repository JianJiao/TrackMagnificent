ItemView = require './ItemView.coffee'

class ItemsView extends Backbone.View
  el: '.items'

  events: ->
    'click .create': 'createOne'

  initialize: ->
    @subviews = []
    @collection.each (item, idx) =>
      view = new ItemView
        model: item
      @subviews.push view
    @listenTo @collection, 'add', @onAdd

  onAdd: (model) ->
    view = new ItemView
      model: model
    @subviews.push view
    @$el.append view.render().el


  createOne: ->
    content = @.$('input').val()
    item = @collection.create({content: content})

  render: ->
    for view in @subviews
      @$el.append view.render().el
    @

module.exports = ItemsView