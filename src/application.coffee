#_require base.coffee
#_require router.coffee
#_require view.coffee

class Application extends Base
  @_instance: null

  @create: ->
    @_instance ||= new @

  constructor: ->
    # Instantiate application modules
    @router = new Router

    # Render view layouts and templates reactively
    View.autoRender();

@Metal.Application = Application
