Item = require '../models/Item'
completedItems = require '../models/completedItems'
_ = require 'underscore'

# controller

# private functions
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
      $elemMatch:
        $gt: today
        $lt: tomorrow
  , (err, items) =>
    if not err
      # filter out completed items
      # completed = completedItems.getItemsId()
      # items = _.difference items, completed
      console.log items
      callback(err, items)
    else
      errCallback err, res


errorCallback = (err, res) ->
  res.send err
  res.statusCode = 500

# Item model's CRUD controller.
module.exports =
  home: (req, res) ->
    getTodayItems (err, items) ->
      if not err
        items = (_.pick(item, '_id', 'content') for item in items)
        itemsStr = JSON.stringify(items)
        res.render 'index', {itemsStr: itemsStr}
      else
        errCallback(err, res)


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

  test: (req, res) ->
    console.log req.body
    if req.body.completed
      completedItems.items.push




  # updateCompleted: (req, res, next) ->
  #   console.log 'got here'
  #   completedItems.updateItems()
  #   next()















