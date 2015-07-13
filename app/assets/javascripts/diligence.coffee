diligence = angular.module 'diligence', [
  'ui.router'
  'templates'
  'lumx'
]

diligence.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "home",
      url: "/"
      controller: ($scope, $templateCache) ->
        window.t = $templateCache
      templateUrl: "home/index.html"
