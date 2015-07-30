#= require application
#= require auth_mock
#= require angular-mocks/angular-mocks
#= require sinonjs/sinon
#= require sinon-stub-promise
#= require jasmine-sinon/lib/jasmine-sinon

'use strict'

beforeEach(module('diligence'))

beforeEach inject (_$httpBackend_, _$compile_, $rootScope, $controller, $location, $injector, $timeout) ->
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

afterEach ->
  @http.resetExpectations()
  @http.verifyNoOutstandingExpectation()
  @sandbox.restore()

