angular.module('diligence').controller "SignUpPageCtrl",
  ($scope, Auth) ->
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
            console.log "USER REGISTERED!", user
          (error) ->
            console.log error
        )
