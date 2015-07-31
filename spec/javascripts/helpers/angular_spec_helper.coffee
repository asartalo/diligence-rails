#= require application
#= require angular-mocks/angular-mocks
#= require auth_mock
#= require sinonjs/sinon
#= require sinon-stub-promise
#= require jasmine-sinon/lib/jasmine-sinon

'use strict'

beforeEach(module('diligence'))

FakePromise = class
  then: (@success, @error, @default) ->
    #

  resolve: (data) ->
    @success(data)
    @default() if @default

  reject: (error) ->
    @error(error)
    @default() if @default

beforeEach inject (_$httpBackend_, _$compile_, $rootScope, $controller, $location, $injector, $timeout, $q) ->
  @rootScope = $rootScope
  @scope = $rootScope.$new()
  @http = _$httpBackend_
  @compile = _$compile_
  @location = $location
  @controller = $controller
  @injector = $injector
  @timeout = $timeout
  @model = (name) =>
    @injector.get(name)
  @eventLoop =
    flush: =>
      @scope.$digest()
  @sandbox = sinon.sandbox.create()
  @q = $q

  @fakeResourceResponse = (resource, method) =>
    fakePromise = new FakePromise
    response = { $promise: fakePromise  }
    @sandbox.stub(resource, method).returns(response)
    fakePromise

afterEach ->
  @http.resetExpectations()
  @http.verifyNoOutstandingExpectation()
  @sandbox.restore()

