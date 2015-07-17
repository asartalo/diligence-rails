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

      .state "temp",
        url: "/temporary"
        controller: ->
          alert "This is temporary! Please change it."
        template: "<h1>This is temporary! Please change it.</h1>"

