'use strict'

angular.module 'trackerApp'
.controller 'ReportsListCtrl', ($scope, $meteor) ->#, toastr, dialogs) ->
  $scope.subscribe('myReports', () -> console.log 'myReports')
  $scope.subscribe('festivities', () -> console.log 'festivities')

  $scope.helpers({
    reports: () ->
        ret = Reports.find({'user._id': Meteor.userId()})
        ret.forEach((d,i,c) -> console.log 'ret>'+i+'>'+d.name)
        ret
  })
    
  $scope.remove = (reportId) ->
#    dlg = dialogs.confirm()
#    dlg.result.then((btn) ->
      Meteor.call('reports.remove', reportId)
#    ,(btn)->
#      console.log "Click no"
#    )


  $scope.addReport = () ->
    tName = moment().format("MMMM") + " " + moment().format("YYYY")
    Meteor.call('reports.insert', Meteor.user(), tName, (error, result) ->
      if error
        console.log error
      else
        console.log result
        if !result
          console.log '{{REPORT_ALREADY_EXISTS | translate}}'
    )
