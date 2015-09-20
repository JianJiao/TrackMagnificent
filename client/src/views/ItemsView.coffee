ItemView = require './ItemView.coffee'

class ItemsView extends Backbone.View
  el: '.items'

  initialize: ->
    @subviews = []
    @collection.each (item, idx) =>
      view = new ItemView
        model: item
      @subviews.push view

  render: ->
    for view in @subviews
      @$el.append view.render().el
    @

module.exports = ItemView