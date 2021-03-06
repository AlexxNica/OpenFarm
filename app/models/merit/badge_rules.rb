# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods
    def initialize
      # for more specific badges: https://github.com/tute/merit
      grant_on '.*guides#create', badge: 'guide-creator'

      grant_on '.*crops#create', badge: 'crop-creator'

      grant_on '.*crops#update', badge: 'crop-editor'

      grant_on '.*gardens#create', badge: 'garden-creator'

      grant_on '.*garden_crops#create', badge: 'gardener'
    end
  end
end
