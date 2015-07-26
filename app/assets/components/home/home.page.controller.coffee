'use strict'

angular.module('diligence').controller "HomePageCtrl",
  ($scope, Auth, $state, currentUser) ->
    $scope.credentials = {
      email: ""
      password: ""
    }

    if Auth.isAuthenticated()
      $state.go "next"

    $scope.authError = false

    $scope.login = (form, creds) ->
      if form.$valid
        Auth.login(creds, interceptAuth: false).then(
          (user) ->
            $scope.authError = false
            $state.go("next")
          (error) ->
            $scope.authError = true
        )

