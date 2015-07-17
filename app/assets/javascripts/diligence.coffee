diligence = angular.module 'diligence', [
  'ui.router'
  'templates'
  'lumx'
  'Devise'
]
  .config (AuthInterceptProvider) ->
    # Intercept 401 Unauthorized everywhere
    AuthInterceptProvider.interceptAuth(true)

