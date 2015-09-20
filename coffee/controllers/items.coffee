Item = require '../models/Item'

# controller

# static functions
getDates = (date) ->
  arr = [0, 1, 2, 4, 7, 15, 30]
  dates = for elem in arr
    aDate = new Date date.toString()
    aDate.setDate aDate.getDate() + elem
    aDate

# Item model's CRUD controller.
module.exports =
  # Creates new Item with data from `req.body`
  create: (req, res) ->
    date = new Date()
    dates = getDates(date)
    attrs =
      date: date
      dates: dates
      content: req.body.content || {}
    item = new Item attrs
    item.save (err, item) ->
      if not err
        res.send item
        res.statusCode = 201
      else
        res.send err
        res.statusCode = 500


  getTodayItems: (req, res) ->
    today = new Date()
    today.setHours 0, 0, 0, 0
    tomorrow = new Date today.toString()
    tomorrow.setDate today.getDate() + 1

    Item.find
      dates:
        $gt: today
        $lt: tomorrow
    , (err, items) ->
      res.send items














