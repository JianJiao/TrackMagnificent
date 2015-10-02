# singleton
completedItems =
  itemsId: []
  date: new Date()

  updateItems: ->
    console.log 'called'
    today = new Date()
    today.setHours 0, 0, 0, 0
    @date.setHours 0, 0, 0, 0
    if today.valueOf() isnt @date.valueOf()
      @items = []

  getItemsId: ->
    @updateItems()
    @itemsId

module.exports = completedItems
