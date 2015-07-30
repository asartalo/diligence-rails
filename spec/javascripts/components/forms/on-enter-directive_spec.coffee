#= require angular_spec_helper

describe 'onEnter', ->
  element = null

  beforeEach ->
    @scope.test = 0
    @scope.foo = (number) =>
      @scope.test = number
      @scope.done()
    element = @compile("<input type='text' on-enter='foo(1)'>")(@scope)
    @scope.$digest()

  onKeyDownEvent = (code) ->
    e = $.Event("keydown")
    e.which = code
    e

  it "listens to enter keydown", (done) ->
    @scope.done = =>
      expect(@scope.test).toEqual(1)
      done()
    $(element).trigger(onKeyDownEvent(13))

  it "ignores other keys", ->
    $(element).trigger(onKeyDownEvent(32))
    expect(@scope.test).toEqual(0)

