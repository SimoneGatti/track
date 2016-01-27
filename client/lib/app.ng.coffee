angular.module('trackerApp', [
  'angular-meteor'
  'accounts.ui'
  'ui.router'
  'ui.bootstrap'
])

.controller 'AppCtrl', ($scope, $state, $rootScope) -># $translate, $rootScope) ->
  $scope.subscribe("configs")


  $scope.autorun (computation) ->
    currentUser=Meteor.user()
    if(currentUser)
    else if(!computation.firstRun)
      $state.go("tracker")
    else

    Meteor.call('firstUse', (error, result) ->
      if error
        $scope.firstRunInDaWorld = false
      else
        $scope.firstRunInDaWorld = result
    )


onReady = () ->
  angular.bootstrap document, ['trackerApp']
  
if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady

Accounts.ui.config({
    'requestPermissions':{
      'google':[
        'https://www.googleapis.com/auth/gmail.send'
      ]
    }
    'requestOfflineToken': {google: true}
})