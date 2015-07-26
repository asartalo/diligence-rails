'use strict'

angular.module('diligence').controller "NextPageCtrl",
  ($scope, Auth, Tasks) ->
    $scope.tasks = []

    $scope.tasks = Tasks.all().then(
      (data) ->
        $scope.tasks = data
    )


