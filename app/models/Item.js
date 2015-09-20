var Item, mongoose;

mongoose = require('mongoose');

Item = new mongoose.Schema({
  currentDate: Date,
  dates: [],
  content: {}
});

Item.methods.getDates = function() {
  var arr, date, dates, elem;
  arr = [0, 1, 2, 4, 7, 15, 30];
  return dates = (function() {
    var i, len, results;
    results = [];
    for (i = 0, len = arr.length; i < len; i++) {
      elem = arr[i];
      date = new Date(this.currentDate.toString());
      date.setDate(this.currentDate.getDate() + elem);
      results.push(date);
    }
    return results;
  }).call(this);
};

module.exports = mongoose.model('Item', Item);

//# sourceMappingURL=Item.js.map
