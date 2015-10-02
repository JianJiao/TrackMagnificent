Item = require '../models/Item.coffee'

class Items extends Backbone.Collection
  model: Item
  url: '/api/items'

  initialize: ->
    @on 'change:completed', (model) =>
      if model.get 'completed'
        @remove model


module.exports = Items