class Item extends Backbone.Model
  idAttribute: '_id'

  done: =>
    @save {completed: true}, {wait: true}
    # note that trigger is synchronous
    # @trigger 'done', @




module.exports = Item




    # $.ajax
    #   url: @url()
    #   type: 'POST'
    #   data: data
    #   contentType: 'application/JSON'
    #   complete: ->
    #     console.log 'completed'
