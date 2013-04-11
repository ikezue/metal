#_require base.coffee

class View extends Base
  # Renders the current template reactively.  The call to `Spark.isolate`
  # passes the function for the `currentTemplate` (uninvoked) as an argument
  # ensuring reactivity.  It may be necessary to wrap the template function
  # in another function to ensure that setting a new `currentTemplate` and
  # changing a template variable both result in a re-render.
  @autoRenderTemplate: ->
    Spark.isolate Template[Session.get 'currentTemplate']

  # Renders the current view layout reactively.  We call `Spark.isolate`,
  # passing it a call to the function of the current layout, which is wrapped
  # in a function.  The function wrapping is necessary because `Spark.isolate`
  # will return a static, non-reactive string otherwise.
  #
  # In the call to the template function of the current layout, we pass a data
  # context object that maps the `{{yield}}` helper to the current template's
  # auto-render function.  This function, `View.autoRenderTemplate`, isolates
  # the current template so that it is rendered reactively as well.
  #
  # This creates two isolated regions. One for the layout and one for the
  # template, with the template's embedded in the layout's.  Both regions
  # are reactive and will result in a re-render if the layout or the template
  # change.
  @autoRenderLayout: ->
    Spark.render =>
      Spark.isolate =>
        Template[Session.get 'currentLayout']? 'yield': @autoRenderTemplate

  @autoRender: ->
    document.body.appendChild @autoRenderLayout()

@Metal.View = View
