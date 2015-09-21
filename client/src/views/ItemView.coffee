class ItemView extends Backbone.View

  render: ->
    template = require '../../templates/item.tmpl.hbs'
    console.log @model
    html = template @model.toJSON()
    console.log html
    @$el.append html
    @

module.exports = ItemView