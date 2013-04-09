describe 'Metal.Application', ->
  describe '.create', ->
    it 'returns a Metal.Application instance', ->
      console.log Metal.Application.create()
      app = Metal.Application.create()
      (app instanceof Metal.Application).should.be.true

    it 'creates a singleton instance', ->
      app1 = Metal.Application.create()
      app2 = Metal.Application.create()
      # app1 = new Metal.Application
      # app2 = new Metal.Application
      (app1 == app2).should.be.true

