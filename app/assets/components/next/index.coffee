'use strict'

angular.module 'diligence'
  .config ($stateProvider, mustLoginProvider) ->
    mustLogin = mustLoginProvider.mustLogin

    $stateProvider
      .state "next", mustLogin
        url: "/next"
        controller: "NextPageCtrl"
        templateUrl: "next/next.html"


