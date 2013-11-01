request = require 'request'

wazeBaseUrl = 'http://test-notifications.staging.waze.com/'
wazify = (path) -> wazeBaseUrl + path

module.exports = (app) ->

  app.get '/notifications.json', (req, res) ->
    url = 'notifications.json'
    request(wazify url).pipe res

  app.post '/notifications.json', (req, res) ->
    url = 'notifications.json'
    r = request.post
      url: wazify url
      json: req.body
    r.pipe res

  app.put '/notifications/:id.json', (req, res) ->
    url = 'notifications/' + req.query.id + '.json'
    r = request.put
      url: wazify url
      json: req.body
    r.pipe res

  app.delete '/notifications/:id.json', (req, res) ->
    url = 'notifications/' + req.query.id + '.json'
    request.del(wazify url).pipe res

  app.put '/notifications/:id/upvote.json', (req, res) ->
    url = 'notifications/' + req.query.id + '/upvote.json'
    request.put(wazify url).pipe res