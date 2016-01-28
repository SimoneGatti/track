'use strict'

angular.module 'trackerApp'
.controller 'UsersCtrl', ($scope) ->
  $scope.subscribe('users')
  $scope.subscribe('reports')

  $scope.res = []
  $scope.res2 = []

  $scope.helpers({
    usersClosed: () ->
      c = $scope.getReactively('res')
      console.log 'helper:'+c
      c
    usersClosed2: () ->
      c = $scope.getReactively('res2')
      console.log 'helper2:'+c
      c
    allUsers: () ->
      Meteor.users.find()
  })

  $scope.getClosed = () ->
    console.log 'getClosed'
    Meteor.call('reports.getClosed', (error, result) ->
      if !error
        console.log 'cb:'+result
        $scope.res = result
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
        $scope.res2 = result
    )

  $scope.prova = () ->
    $scope.res = ['prova']