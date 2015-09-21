Item = require '../models/Item'

# controller

# static functions
getDates = (date) ->
  arr = [0, 1, 2, 4, 7, 15, 30]
  dates = for elem in arr
    aDate = new Date date.toString()
    aDate.setDate aDate.getDate() + elem
    aDate

getTodayItems = (callback) ->
  today = new Date()
  today.setHours 0, 0, 0, 0
  tomorrow = new Date today.toString()
  tomorrow.setDate today.getDate() + 1

  Item.find
    dates:
      $gt: today
      $lt: tomorrow
  , callback

errorCallback = (err, res) ->
  res.send err
  res.statusCode = 500

# Item model's CRUD controller.
module.exports =
  home: (req, res) ->
    getTodayItems (err, items) ->
      if not err
        items = ({content: item.content} for item in items)
        itemsStr = JSON.stringify(items)
        res.render 'index', {itemsStr: itemsStr}
      else
        errCallbac(err, res)


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
        errCallback(err, res)


  todayItems: (req, res) ->
    getTodayItems (err, items) ->
      if not err
        res.send items
      else
        errCallback(err, res)














