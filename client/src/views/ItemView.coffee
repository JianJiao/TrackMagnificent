class ItemView extends Backbone.View

  render: ->
    template = require '../../templates/item.tmpl.hbs'
    html = template @model.toJSON()
    @$el.append html
    @

module.exports = ItemView