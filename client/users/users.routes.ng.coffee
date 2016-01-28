'use strict'

angular.module 'trackerApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'users',
    url: '/users'
    templateUrl: 'client/users/users.view.ng.html'
    controller: 'UsersCtrl'