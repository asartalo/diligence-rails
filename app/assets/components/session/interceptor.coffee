'use strict'

# This attempts to solve a problem with angular_rails_csrf
# See https://github.com/jsanders/angular_rails_csrf/issues/4
#
# To solve that, we intercept 422 responses and attempt to get
# a new csrf token by sending a ping. We then retry the request
# hopefully with the new token.
angular.module('diligence').factory "tokenAuthenticityInterceptor",
  ($q, $injector) ->
    retries = 0
    responseError: (response) ->
      if response.status == 422 and retries == 0
        retries++
        deferred = $q.defer()
        $http = $injector.get('$http')
        $http.get('/api/v1/ping')
          .success ->
            # retry
            $http(response.config)
              .success (r) ->
                retries = 0
                deferred.resolve(r)
              .error (e) ->
                retries = 0
                deferred.reject(e)
          .error ->
            retries = 0
            deferred.reject(response)
        return deferred.promise
      else
        retries = 0
        return $q.reject(response)

