Item = require '../models/Item.coffee'

class Items extends Backbone.Collection
  model: Item
  url: '/api/items'


module.exports = Items