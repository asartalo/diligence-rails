angular.module('diligence').controller "HomePageCtrl",
  ($scope, Auth, $state) ->
    $scope.credentials = {
      email: ""
      password: ""
    }

    $scope.login = (form, creds) ->
      if form.$valid
        Auth.login(creds).then(
          (user) ->
            # TODO: Change this
            $state.transitionTo("temp")
          (error) ->
            alert JSON.stringify(error)
        )

