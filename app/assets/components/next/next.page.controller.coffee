'use strict'

angular.module('diligence').controller "NextPageCtrl",
  ($scope, Auth, Tasks) ->
    $scope.tasks = Tasks.query()


