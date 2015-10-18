'use strict'

angular.module('diligence').controller "TasksPageCtrl",
  ($scope, currentUser, Tasks, $timeout) ->
    $scope.newTask = {name: ""}
    $scope.user = currentUser

    Tasks.query().$promise.then (tasks) ->
      $scope.tasks = tasks

    $scope.newTaskReset = ->
      $scope.newTask.name = ""

    $scope.createTask = (form, task) ->
      if form.$valid
        Tasks.save(task).$promise.then(
          (newTask) ->
            $scope.tasks.push newTask
            $scope.newTaskReset()
        )

    $scope.updateTask = (task) ->
      Tasks.update(task)

    $scope.appendTaskAfter = (reference) ->
      Tasks.append(reference).$promise.then(
        (tasks) ->
          $scope.tasks = tasks
      )

    $scope.deleteTask = (task) ->
      Tasks.delete(task).$promise.then ->
        _.remove($scope.tasks, id: task.id)

    $scope.archiveTask = (task) ->
      task.archived = true
      Tasks.update(task).$promise.then ->
        _.remove($scope.tasks, id: task.id)


