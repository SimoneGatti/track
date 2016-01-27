'use strict'

angular.module 'trackerApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'reports',
    url: '/reports'
    abstract: true
    template: '<ui-view/>'
  .state 'reports.list',
    url: '/list'
    templateUrl: 'client/reports/reports-list.view.ng.html'
    controller: 'ReportsListCtrl'
  .state 'reports.detail',
    url: '/detail/:reportId'
    templateUrl: 'client/reports/report-detail.view.ng.html'
    controller: 'ReportDetailCtrl'
    
