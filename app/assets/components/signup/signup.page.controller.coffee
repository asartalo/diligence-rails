angular.module('diligence').controller "SignUpPageCtrl",
  ($scope, Auth, $state) ->
    $scope.credentials = {
      name: ""
      email: ""
      password: ""
    }

    $scope.signup = (form, creds) ->
      if form.$valid
        # Because password confirmations are unnecessary
        creds.password_confirmation = creds.password
        Auth.register(creds).then(
          (user) ->
            $state.transitionTo("tasks")
          (error) ->
            console.log error
        )
