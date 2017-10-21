class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role? :admin_role
      can :manage, :all
    elsif user.has_role? :GYM_CONTROL_ROLE
      can [:create, :read, :edit, :update, :destroy], Gym
    elsif user.has_role? :STUDENT_CONTROL_ROLE
      can [:create, :read, :edit, :update, :destroy], Student
    elsif user.has_role? :USER_CONTROL_ROLE
      can [:create, :read, :edit, :update, :destroy], Admin
    elsif user.has_role? :PROFILE_CONTROL_ROLE
      can [:create, :read, :edit, :update, :destroy], Profile
    elsif user.has_role? :ROLE_CONTROL_ROLE
      can [:create, :read, :edit, :update, :destroy], Role
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
