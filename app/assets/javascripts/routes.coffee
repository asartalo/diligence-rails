'use strict'

angular.module 'diligence'
  .config ($stateProvider, $urlRouterProvider, mustLoginProvider) ->
    mustLogin = mustLoginProvider.mustLogin
    $urlRouterProvider.otherwise "/"

    $stateProvider
      .state "temp", mustLogin
        url: "/temporary"
        controller: ($scope, Auth, $state, currentUser) ->
          console.log "This is temporary! Please change it.", currentUser
          $scope.logout = ->
            Auth.logout()
            $state.transitionTo("home")
        template: "<h1>This is temporary! Please change it.</h1> <p><a ng-click='logout()'>Logout</a></p>"

