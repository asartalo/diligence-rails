diligence = angular.module 'diligence', [
  'ui.router'
  'templates'
  'lumx'
  'Devise'
]
  .provider 'mustLogin', ( mustLogin = ->
    # This here is what we really want
    @mustLogin = (stateOpts) ->
      stateOpts.intereceptAuth = true
      stateOpts.resolve ||= {}
      stateOpts.resolve.currentUser = (Auth) ->
        Auth.currentUser()
      stateOpts

    @$get = [ ->
      return ->
        # This is is to get around with Angular's requirements
    ]
    return
  )

  .config (AuthInterceptProvider, $locationProvider, $httpProvider) ->
    # Intercept 401 Unauthorized everywhere
    AuthInterceptProvider.interceptAuth(true)

    $locationProvider.html5Mode(true)
    $httpProvider.defaults.withCredentials = true

  .run ($rootScope, $state, $stateParams, Auth) ->
    $rootScope.$on 'devise:unauthorized', (event, xhr, deferred) ->
      console.dir $state.current
      if $state.current.interceptAuth
        $state.go("home")
      else
        console.log "YOYOYO"

