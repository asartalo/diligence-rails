angular.module 'diligence'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/"

    $stateProvider
      .state "home",
        url: "/"
        controller: "HomePageController"
        templateUrl: "home/index.html"

