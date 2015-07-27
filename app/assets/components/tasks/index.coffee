angular.module 'diligence'
  .config ($stateProvider, mustLoginProvider) ->
    hasUser = mustLoginProvider.hasUser
    $stateProvider
      .state "tasks", hasUser
        url: "/tasks"
        controller: "TasksPageCtrl"
        templateUrl: "tasks/tasks.html"
        interceptAuth: true

