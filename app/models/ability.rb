class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :Admin
      can :manage, :all
    elsif user.role? :Researcher
      can :read, [Item] 
      can :update, [Item]
    elsif user.role? :Guest
      can :read, [Item]
      # do |item|
      #  item.try(:user) == user || user.role?(:Researcher)
     # end
    elsif user.role? :Registered
	    can :read, [Item] 
            can :destroy, [Item] 
            # do |item|
       # item.try(:user) == user || user.role?(:Registered) 
        #end
     # can :read, Item do |item|
     #  item.try(:owner) == 2
     # end
    #  can :index, Item do |item|
     #  item.try(:owner) == 2
     # end
      #can :create, [Item]
      # manage products, assets he owns
     can :list, Item do |item|
       item.try(:owner) == 2
     end
    end
  end

end
