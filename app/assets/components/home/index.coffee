angular.module 'diligence'
  .config ($stateProvider, mustLoginProvider) ->
    hasUser = mustLoginProvider.hasUser
    $stateProvider
      .state "home", hasUser
        url: "/"
        controller: "HomePageCtrl"
        templateUrl: "home/index.html"
