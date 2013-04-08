ClassMixin =
  a: () -> 1
  b: () -> 2

InstanceMixin =
  c: () -> 3
  d: () -> 4

ClassMixinWithExtendedHook =
  e: () -> 5
  f: () -> 6
  extended: ->
    @g = 7
    @include InstanceMixin

InstanceMixinWithIncludedHook =
  h: () -> 8
  i: () -> 9
  included: ->
    @j = 10

describe 'Metal.Module', ->
  A = B = C = D = null

  beforeEach ->
    class A extends Metal.Module
      @extend ClassMixin

    class B extends Metal.Module
      @extend ClassMixinWithExtendedHook

    class C extends Metal.Module
      @include InstanceMixin

    class D extends Metal.Module
      @include InstanceMixinWithIncludedHook

  describe '.extend', ->
    it 'should add class level properties', ->
      A.a().should.equal 1
      A.b().should.equal 2
    it 'should trigger the extended() callback', ->
      B.e().should.equal 5
      B.f().should.equal 6
      B.g.should.equal 7
      b = new B
      b.c().should.equal 3
      b.d().should.equal 4

  describe '.include', ->
    it 'should add instance level properties', ->
      c = new C
      c.c().should.equal 3
      c.d().should.equal 4
    it 'should trigger the included() callback', ->
      d = new D
      d.h().should.equal 8
      d.i().should.equal 9
      D.j.should.equal 10
