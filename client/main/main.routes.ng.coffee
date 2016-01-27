'use strict'

angular.module 'trackerApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'tracker',
    url: '/'
    templateUrl: 'client/main/main.view.ng.html'
    controller: 'MainCtrl'
