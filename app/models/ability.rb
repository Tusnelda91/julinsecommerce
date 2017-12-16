class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
  
    if user.admin?
      can [:manage, :destroy], :all
    else
       can :read, :all
      cannot :manage, Product
    end
  end
end
