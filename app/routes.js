var home, items;

home = require('./controllers/home');

items = require('./controllers/items');

module.exports.initialize = function(app) {
  app.get('/', items.home);
  app.post('/api/items/create', items.create);
  return app.get('/api/items/todayItems', items.todayItems);
};

//# sourceMappingURL=routes.js.map
