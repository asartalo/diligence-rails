angular.module('diligence').controller "TasksPageCtrl",
  ($scope, Auth) ->
    $scope.user = Auth.currentUser()

