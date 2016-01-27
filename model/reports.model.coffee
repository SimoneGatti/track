@Reports = new Mongo.Collection('reports')

Meteor.methods
  'reports.remove': (reportId) ->
    Reports.remove reportId