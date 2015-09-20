Item = require '../models/Item.coffee'

class Items extends Backbone.Collection
  model: Item


module.exports = Items