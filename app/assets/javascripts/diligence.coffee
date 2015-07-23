diligence = angular.module 'diligence', [
  'ui.router'
  'templates'
  'lumx'
  'Devise'
]
  .config (AuthInterceptProvider, $locationProvider) ->
    # Intercept 401 Unauthorized everywhere
    AuthInterceptProvider.interceptAuth(true)

    $locationProvider.html5Mode(true)

