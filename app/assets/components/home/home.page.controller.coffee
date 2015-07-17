angular.module('diligence').controller "HomePageCtrl",
  ($scope, $templateCache) ->
    $scope.credentials = {
      email: ""
      password: ""
    }

    $scope.login = (form, creds) ->
      console.log creds

