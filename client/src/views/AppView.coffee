Items = require '../collections/Items.coffee'
ItemsView = require './ItemsView.coffee'

class AppView extends Backbone.View
  initialize: ->
    console.log 'ok?'
    itemsJSON = $('.items').data('items')
    console.log itemsJSON
    items = new Items(itemsJSON)
    @itemsView = new ItemsView
      collection: items
    console.log 'should remove source map'

module.exports = AppView