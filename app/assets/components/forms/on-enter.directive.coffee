'use strict'

angular.module 'diligence'
.directive 'onEnter', ->

  restrict: 'A'
  link: (scope, element, attrs) ->
    $(element).on 'keydown', (e) ->
      if e.which == 13
        e.preventDefault()
        scope.$eval(attrs['onEnter'])


