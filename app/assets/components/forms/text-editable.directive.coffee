'use strict'

angular.module 'diligence'
.directive 'textEditable', ($timeout) ->
  restrict: 'E'
  templateUrl: 'forms/text-editable.html'
  link: (scope, element, attrs) ->
    scope.editMode = false
    $field = $(element.find('textarea')[0])

    scope.startEdit = ->
      scope.editMode = true
      $timeout(
        ->
          $field.focus()
          $field.select()
        0
      )
      return

    scope.finished = ->
      $field.blur()
      return

    scope.doneEditing = ->
      scope.editMode = false
      scope.onFinish()

  scope:
    text: '=ngModel'
    onFinish: '&'

