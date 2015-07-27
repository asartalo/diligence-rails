angular.module('diligence').controller "TasksPageCtrl",
  ($scope, currentUser, Tasks) ->
    $scope.newTask = {name: ""}
    $scope.user = currentUser
    $scope.tasks = Tasks.query()

    $scope.newTaskReset = ->
      $scope.newTask.name = ""

    $scope.createTask = (form, task) ->
      if form.$valid
        Tasks.save(task).$promise.then(
          (newTask) ->
            $scope.tasks.unshift newTask
            $scope.newTaskReset()
        )

    $scope.toggleStatus = (task) ->
      Tasks.update(task).$promise.then(
        ->
          # Do nothing
        ->
          task.done = !task.done
      )

    $scope.updateTask = (task) ->
      Tasks.update(task)


