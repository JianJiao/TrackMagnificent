Items = require '../collections/Items.coffee'
ItemsView = require './ItemsView.coffee'

class AppView extends Backbone.View
  initialize: ->
    # jquery converts the str to JSON obj for you
    itemsJSON = $('.items').data('items')
    console.log itemsJSON
    items = new Items(itemsJSON)
    @itemsView = new ItemsView
      collection: items
    @itemsView.render()

module.exports = AppView