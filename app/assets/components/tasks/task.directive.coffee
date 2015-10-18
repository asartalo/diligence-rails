'use strict'

angular.module('diligence').directive "task", ($timeout) ->
  restrict: 'A'
  templateUrl: 'tasks/task.directive.html'
  replace: true
  link: (scope, el, attrs) ->
    scope.editing = false

    scope.insertTask = ->
      scope.onInsert()

    scope.remove = ->
      theEl = $(el)
      theEl.css(maxHeight: theEl.height())
      scope.onDelete()

    scope.archive = ->
      theEl = $(el)
      theEl.css(maxHeight: theEl.height())
      scope.onArchive()

    scope.finish = ->
      scope.onUpdate()
      $timeout(
        ->
          scope.editing = false
        300
      )

    scope.editMode = ->
      scope.editing = true

  scope:
    task: '='
    onUpdate: '&'
    onDelete: '&'
    onInsert: '&'
    onArchive: '&'

