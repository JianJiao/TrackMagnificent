var Item, errorCallback, getDates, getTodayItems;

Item = require('../models/Item');

getDates = function(date) {
  var aDate, arr, dates, elem;
  arr = [0, 1, 2, 4, 7, 15, 30];
  return dates = (function() {
    var i, len, results;
    results = [];
    for (i = 0, len = arr.length; i < len; i++) {
      elem = arr[i];
      aDate = new Date(date.toString());
      aDate.setDate(aDate.getDate() + elem);
      results.push(aDate);
    }
    return results;
  })();
};

getTodayItems = function(callback) {
  var today, tomorrow;
  today = new Date();
  today.setHours(0, 0, 0, 0);
  tomorrow = new Date(today.toString());
  tomorrow.setDate(today.getDate() + 1);
  return Item.find({
    dates: {
      $gt: today,
      $lt: tomorrow
    }
  }, callback);
};

errorCallback = function(err, res) {
  res.send(err);
  return res.statusCode = 500;
};

module.exports = {
  home: function(req, res) {
    return getTodayItems(function(err, items) {
      var item, itemsStr;
      if (!err) {
        items = (function() {
          var i, len, results;
          results = [];
          for (i = 0, len = items.length; i < len; i++) {
            item = items[i];
            results.push({
              content: item.content
            });
          }
          return results;
        })();
        itemsStr = JSON.stringify(items);
        return res.render('index', {
          itemsStr: itemsStr
        });
      } else {
        return errCallbac(err, res);
      }
    });
  },
  create: function(req, res) {
    var attrs, date, dates, item;
    date = new Date();
    dates = getDates(date);
    attrs = {
      date: date,
      dates: dates,
      content: req.body.content || {}
    };
    item = new Item(attrs);
    return item.save(function(err, item) {
      if (!err) {
        res.send(item);
        return res.statusCode = 201;
      } else {
        return errCallback(err, res);
      }
    });
  },
  todayItems: function(req, res) {
    return getTodayItems(function(err, items) {
      if (!err) {
        return res.send(items);
      } else {
        return errCallback(err, res);
      }
    });
  }
};

//# sourceMappingURL=items.js.map
