angular.module 'diligence'
  .config ($stateProvider) ->
    $stateProvider
      .state "home",
        url: "/"
        controller: "HomePageCtrl"
        templateUrl: "home/index.html"
