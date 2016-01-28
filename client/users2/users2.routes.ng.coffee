'use strict'

angular.module 'trackerApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'users2',
    url: '/users2'
    templateUrl: 'client/users2/users2.view.ng.html'
    controller: 'Users2Ctrl'