'use strict'

angular.module 'diligence'
  .config ($urlRouterProvider) ->
    $urlRouterProvider.otherwise "/"
