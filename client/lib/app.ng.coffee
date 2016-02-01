angular.module('trackerApp', [
  'angular-meteor'
  'accounts.ui'
  'ui.router'
  'ui.bootstrap'
  'pascalprecht.translate'
  'toastr'
])
.run(($templateCache) ->
  $templateCache.put('yo-toastr.html', """
        <div class="{{toastClass}} {{toastType}}" ng-click="tapToast()">
            <div ng-switch on="allowHtml">
                <div ng-switch-default ng-if="title" class="{{titleClass}}" aria-label="{{title}}">{{title | translate | capitalize}}</div>
                <div ng-switch-default class="{{messageClass}}" aria-label="{{message}}">{{message | translate | capitalize}}</div>
                <div ng-switch-when="true" ng-if="title" class="{{titleClass}}" ng-bind-html="title"></div>
                <div ng-switch-when="true" class="{{messageClass}}" ng-bind-html="message"></div>
            </div>
            <progress-bar ng-if="progressBar"></progress-bar>
        </div>
      """)
)

.controller 'AppCtrl', ($scope, $state, $rootScope, toastr, $translate) -># $translate, $rootScope) ->
  $scope.subscribe("configs")

  $translate.use("en-US")

  $scope.toastMe = ()->
    toastr.info("APPLE")


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


.config ($translateProvider, toastrConfig) ->

  angular.extend(toastrConfig, {
    allowHtml: false,
    templates: {
      toast: "yo-toastr.html"
    }
  })


  $translateProvider.useLoader('customLangLoader', {})
  $translateProvider.useMissingTranslationHandler("myCustomHandlerFactory")

  #Enable escaping of HTML
  $translateProvider.useSanitizeValueStrategy(null)

.factory 'myCustomHandlerFactory', ($log) ->
  (translationID) ->
    $log.warn("Translation for " + translationID + " doesn't exist!!!")
    return '[[[[[[[[[[[[[[[ NO TRANSLATE KEY FOUND FOR ' + translationID + ' !! ]]]]]]]]]]]]]]]'

.factory 'customLangLoader', ($http, $q) ->
  (options) ->

    url = 'i18n/locale_' + options.key + '.json'
    deferred = $q.defer()
    $http(
      method: 'GET'
      url: url)
    .success((data) ->
      deferred.resolve data
      return
    ).error ->
      deferred.reject options.key
      return
    deferred.promise


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