angular.module 'diligence'
  .config ($stateProvider) ->

    $stateProvider
      .state "signup",
        url: "/signup"
        controller: "SignUpPageCtrl"
        templateUrl: "signup/signup.html"
        interceptAuth: false


