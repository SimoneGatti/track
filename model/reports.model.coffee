@Reports = new Mongo.Collection('reports')

Meteor.methods
  'reports.toggleChiuso': (reportId, chiuso) ->
    Reports.update(reportId, { $set: { chiuso: chiuso } })
  'reports.remove': (reportId) ->
    Reports.remove reportId