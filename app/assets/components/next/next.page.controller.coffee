'use strict'

angular.module('diligence').controller "NextPageCtrl",
  ($scope, Auth, $state) ->
    $scope.credentials = {
      email: ""
      password: ""
    }
