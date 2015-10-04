'use strict'

angular.module('diligence').factory "Tasks",
  ($http, $q, $resource) ->
    defaults = id: '@id'

    $resource '/api/v1/tasks/:id', defaults,
      update:
        method: 'put'
      append:
        method: 'post'
        isArray: true
        url: '/api/v1/tasks/:id/append'
