angular.module 'diligence'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/"

    $stateProvider
      .state "home",
        url: "/"
        controller: "HomePageCtrl"
        templateUrl: "home/index.html"
        interceptAuth: false

      .state "signup",
        url: "/signup"
        controller: "SignUpPageCtrl"
        templateUrl: "signup/signup.html"
        interceptAuth: false

