'use strict'

angular.module('diligence').controller "TasksPageCtrl",
  ($scope, currentUser, Tasks, $timeout) ->
    $scope.newTask = {name: ""}
    $scope.user = currentUser

    compare = (t1, t2) ->
      # return 0 if t1 == t2
      if t1 > t2
        1
      else
        if t1 < t2
          -1
        else
          0

    $scope.sortTasks = ->
      $timeout( ->
        $scope.tasks.sort (t1, t2) ->
          result = compare(t1.done, t2.done)
          return result if result != 0
          compare(t1.created_at, t2.created_at)
      )

    Tasks.query().$promise.then (tasks) ->
      $scope.tasks = tasks
      $scope.sortTasks()

    $scope.newTaskReset = ->
      $scope.newTask.name = ""

    $scope.createTask = (form, task) ->
      if form.$valid
        Tasks.save(task).$promise.then(
          (newTask) ->
            $scope.tasks.push newTask
            $scope.sortTasks()
            $scope.newTaskReset()
        )

    $scope.updateTask = (task) ->
      Tasks.update(task)
      $scope.sortTasks()

    $scope.deleteTask = (task) ->
      Tasks.delete(task).$promise.then ->
        _.remove($scope.tasks, id: task.id)


