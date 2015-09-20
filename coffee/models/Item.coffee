mongoose = require 'mongoose'

# Item model
Item = new mongoose.Schema(
  currentDate: Date
  dates: []
  content: {}
)


Item.methods.getDates = ->
  arr = [0, 1, 2, 4, 7, 15, 30]
  dates = for elem in arr
    date = new Date @currentDate.toString()
    date.setDate @currentDate.getDate() + elem
    date

module.exports = mongoose.model 'Item', Item