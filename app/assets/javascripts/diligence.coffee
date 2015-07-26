diligence = angular.module 'diligence', [
  'ui.router'
  'templates'
  'lumx'
  'Devise'
]
  .provider 'mustLogin', ( mustLogin = ->
    # This here is what we really want
    @mustLogin = (stateOpts) =>
      stateOpts.interceptAuth = true
      stateOpts.resolve ||= {}
      stateOpts.resolve.currentUser = (Auth) ->
        Auth.currentUser()
      stateOpts

    @hasUser = (stateOpts) ->
      stateOpts.resolve ||= {}
      stateOpts.resolve.currentUser = (Auth, $q) ->
        deferred = $q.defer()
        Auth.currentUser().then(
          (user) ->
            deferred.resolve(user)
          (e) ->
            deferred.resolve({})
        )
        deferred.promise
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

  .config ($httpProvider) ->
    $httpProvider.interceptors.push "tokenAuthenticityInterceptor"

  .run ($rootScope, $state, $stateParams, Auth) ->
    $rootScope.$on 'devise:unauthorized', (event, xhr, deferred) ->
      currentState = $state.current
      if currentState.interceptAuth || (currentState.abstract && currentState.name == "")
        $state.transitionTo("home")

