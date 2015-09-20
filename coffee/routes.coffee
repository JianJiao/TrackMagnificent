home = require('./controllers/home')
items = require('./controllers/items')

module.exports.initialize = (app) ->
  app.get '/', items.home
  app.post '/api/items/create', items.create
  app.get '/api/items/todayItems', items.todayItems












  # app.get '/api/contacts', contacts.index
  # app.get '/api/contacts/:id', contacts.getById
  # app.post '/api/contacts', contacts.add
  # # app.put('/api/contacts', contacts.update);
  # app.delete '/api/contacts/:id', contacts.delete
  # return


