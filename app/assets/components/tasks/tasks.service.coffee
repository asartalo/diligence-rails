'use strict'

angular.module('diligence').factory "Tasks",
  ($http, $q) ->

    all: ->
      deferred = $q.defer()
      $http.get '/api/v1/tasks'
        .success (data) ->
          deferred.resolve(data)
        .error (err) ->
          deferred.reject(err)

      deferred.promise

