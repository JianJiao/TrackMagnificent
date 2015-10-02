var home, items;

home = require('./controllers/home');

items = require('./controllers/items');

module.exports.initialize = function(app) {
  app.get('/', items.home);
  app.post('/api/items', items.create);
  app.get('/api/items/todayItems', items.todayItems);
  return app.put('/api/items/:id', items.test);
};

//# sourceMappingURL=routes.js.map
