angular.module 'diligence'
  .config ($stateProvider) ->
    $stateProvider
      .state "tasks",
        url: "/tasks"
        controller: "TasksPageCtrl"
        templateUrl: "tasks/tasks.html"
        interceptAuth: true

