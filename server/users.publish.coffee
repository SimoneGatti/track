Meteor.publish('users', () ->
  Meteor.users.find()
)

Meteor.users.allow({
  update: (userId, docs, fields, modifier) -> { }
})


Accounts.validateLoginAttempt((attempt) ->
    true
)

#  [Yo] Aggiungo info all'utente creato con account google e travaso le info di profile nel caso di system admin [yo]
Accounts.onCreateUser((opts, user) ->
  profile = opts.profile
  if !profile.hasOwnProperty("roles")
    profile.roles = ["USER"]
  profile.active = false



  user.profile = profile
  user
)
