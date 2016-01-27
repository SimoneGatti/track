'use strict'

angular.module 'trackerApp'
.directive 'toolbar', ->
  restrict: 'AE'
  templateUrl: 'client/components/toolbar/toolbar.view.ng.html'
  replace: true
  controller: "toolbarCtrl"
