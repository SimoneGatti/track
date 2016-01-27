Meteor.publish('reports', () ->
  Reports.find()
)
Meteor.publish('myReports', () ->
  if this.userId
    Reports.find({'user._id': this.userId})
  else
    this.ready()
)

Reports.allow
  insert: (userId, report) ->
    userId
  update: (userId, report, fields, modifier) ->
    userId
  remove: (userId, report) ->
    userId

Meteor.methods
  'reports.myReportExists': (userId, tName) ->
    Reports.find({'user._id': userId, name: tName}).count() > 0

  'reports.insert': (user, tName) ->
    exists = Meteor.call('reports.myReportExists', user._id, tName)
    if exists
      return false
    else
      currentDate = moment()
      days = []
      _.times(currentDate.daysInMonth(), (d) ->

        days.push {
            datetime: moment().date(d+1).toDate()
            dayOfWeek: moment().date(d+1).format("d")
            ore: ""
          }
      )
      Reports.insert {
          name: tName
          user: user
          chiuso: false
          table: days
        }
      return true