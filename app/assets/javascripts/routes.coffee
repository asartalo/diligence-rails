angular.module 'diligence'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/"

    $stateProvider
      .state "temp",
        url: "/temporary"
        controller: ->
          alert "This is temporary! Please change it."
        template: "<h1>This is temporary! Please change it.</h1>"

