'use strict'

angular.module('diligence').directive "task", ($timeout) ->
  restrict: 'A'
  templateUrl: 'tasks/task.directive.html'
  replace: true
  link: (scope, el, attrs) ->
    scope.remove = ->
      theEl = $(el)
      theEl.css(maxHeight: theEl.height())
      scope.onDelete()

    scope.finish = ->
      scope.onUpdate()

  scope:
    task: '='
    onUpdate: '&'
    onDelete: '&'
