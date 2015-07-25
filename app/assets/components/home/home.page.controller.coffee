'use strict'

angular.module('diligence').controller "HomePageCtrl",
  ($scope, Auth, $state) ->
    $scope.credentials = {
      email: ""
      password: ""
    }

    $scope.authError = false

    $scope.login = (form, creds) ->
      if form.$valid
        Auth.login(creds, interceptAuth: false).then(
          (user) ->
            $scope.authError = false
            $state.transitionTo("next")
          (error) ->
            $scope.authError = true
        )

