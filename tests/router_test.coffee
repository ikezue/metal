describe 'Metal.Router', ->
  app = router = null

  beforeEach ->
    app = Metal.Application.create()
    router = app.router

  describe '#map', ->
    it 'passes the Router instance to its callback argument', (done) ->
      router.map ->
        (@ instanceof Metal.Router).should.be.true
        done()

    it 'maps a route to a set of options', ->
      router.map ->
        @route 'about', path: '/about'
        @route 'faves', path: '/faves'
      router.routes['about'].path.should.equal '/about'
      router.routes['faves'].path.should.equal '/faves'

    it 'sets the path to the route name if missing', ->
      router.map ->
        @route 'about'
      router.routes['about'].path.should.equal '/about'

