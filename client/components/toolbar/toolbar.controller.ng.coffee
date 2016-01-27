'use strict'

angular.module 'trackerApp'
.controller 'toolbarCtrl', ($scope) ->

  $scope.helpers({
    loggedUser: () ->
      Meteor.user()
  })

