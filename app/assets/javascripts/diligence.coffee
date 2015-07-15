diligence = angular.module 'diligence', [
  'ui.router'
  'templates'
  'lumx'
  'Devise'
]

diligence.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "home",
      url: "/"
      controller: ($scope, $templateCache) ->
        $scope.login = {
          email: ""
          password: ""
        }

      templateUrl: "home/index.html"
