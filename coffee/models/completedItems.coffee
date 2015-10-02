# singleton
completedItems =
  itemsId: {} # a set
  date: new Date()

  updateItems: ->
    today = new Date()
    today.setHours 0, 0, 0, 0
    @date.setHours 0, 0, 0, 0
    if today.valueOf() isnt @date.valueOf()
      @itemsId = {}

  getItemsId: ->
    @updateItems()
    @itemsId

  # add ids of completed items to the set
  add: (id) ->
    @itemsId[id] = 1

module.exports = completedItems
