class Module
  @keywords = ['included', 'extended']

  @include: (obj) ->
    # Add object properties to instance object, ignoring the specially named
    # callbacks `included and `excluded`, if found.
    for key, value of obj when key not in Module.keywords
      @::[key] = value
    # Call the `included()` callback on the instance object, if it exists.
    obj.included?.apply @
    @

  @extend: (obj) ->
    # Add object properties to class object, ignoring the specially named
    # callbacks `included and `excluded`, if found.
    for key, value of obj when key not in Module.keywords
      @[key] = value
    # Call the `extended()` callback on the class object, if it exists.
    obj.extended?.apply @
    @

@Metal = {}
@Metal.Module = Module
