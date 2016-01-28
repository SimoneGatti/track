Meteor.methods
  'reports.getClosed': () ->
    closed = []

    reports = Reports.find().fetch()

    groupedReports = _.groupBy(reports, (report) ->
        report.user._id
    )

    _.each(_.values(groupedReports), (reportsGroupedByUser) ->
      closedReports = []
      userId = ""
      reportsGroupedByUser.forEach (report) ->
        if report.chiuso
          closedReports.push(report._id)
          userId = report.user._id
      if closedReports.length == reportsGroupedByUser.length
        closed.push(userId)
    )

    return closed