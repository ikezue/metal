#_require base.coffee

class RouteManager
  constructor: ->

class Router
  constructor: ->
    @manager = new RouteManager
    @routes = {}

  map: (callback) ->
    callback.call @

  route: (name, options = {}) ->
    @routes[name] = options
    options.path = "/#{name}" unless typeof options.path == 'string'

@Metal.Router = Router
