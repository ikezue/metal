#_require base.coffee
#_require router.coffee

class Application extends Base
  @_instance: null

  @create: ->
    @_instance ||= new @

  constructor: ->
    @router = new Router

@Metal.Application = Application
