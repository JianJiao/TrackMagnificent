var home, items;

home = require('./controllers/home');

items = require('./controllers/items');

module.exports.initialize = function(app) {
  app.get('/', home.index);
  app.post('/api/items/create', items.create);
  return app.get('/api/items/todayItems', items.getTodayItems);
};

//# sourceMappingURL=routes.js.map
