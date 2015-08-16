angular.module 'diligence'
  .config ($stateProvider, mustLoginProvider) ->
    mustLogin = mustLoginProvider.mustLogin
    $stateProvider
      .state "tasks", mustLogin
        url: "/tasks"
        controller: "TasksPageCtrl"
        templateUrl: "tasks/tasks.html"
        interceptAuth: true

