angular.module('diligence').controller "HomePageController",
  ($scope, $templateCache) ->
    $scope.credentials = {
      email: ""
      password: ""
    }

    $scope.login = (form, creds) ->
      console.log creds

