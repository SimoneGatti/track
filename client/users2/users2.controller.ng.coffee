'use strict'

angular.module 'trackerApp'
.controller 'Users2Ctrl', ($scope) ->
  $scope.subscribe('users')
  $scope.subscribe('reports')

  $scope.helpers({
    usersClosed3:[]
    usersClosed4:[]
    allUsers: () ->
      Meteor.users.find()
  })

  $scope.getClosed = () ->
    console.log 'getClosed'
    Meteor.call('reports.getClosed', (error, result) ->
      if !error
        console.log 'cb:'+result
        $scope.usersClosed3 = result
    )
  $scope.getClosed()
  Reports.find().observeChanges(
    added: (id, fields) ->
      console.log 'added'
      $scope.getClosed()
    changed: (id, fields) ->
      console.log 'changed'
      $scope.getClosed()
    removed: (id) ->
      console.log 'removed'
      $scope.getClosed()
  )

  $scope.autorun (computation) ->
    Reports.find()
    console.log 'autorun'
    Meteor.call('reports.getClosed', (error, result) ->
      if !error
        console.log 'cb2:'+result
        $scope.usersClosed4 = result
    )
