'use strict'

angular.module 'trackerApp'
.controller 'ReportDetailCtrl', ($scope, $stateParams, $modal) ->#, toastr) ->
  $scope.subscribe('reports')

  $scope.helpers({
    report: () ->
      Reports.findOne($stateParams.reportId)
  })

  $scope.collapsed = true

  $scope.isNumber = angular.isNumber

