angular.module 'diligence'
  .config ($stateProvider, mustLoginProvider) ->
    hasUser = mustLoginProvider.hasUser
    $stateProvider
      .state "signup", hasUser
        url: "/signup"
        controller: "SignUpPageCtrl"
        templateUrl: "signup/signup.html"


