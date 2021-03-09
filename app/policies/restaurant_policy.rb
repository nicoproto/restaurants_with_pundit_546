class RestaurantPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    # user -> current_user
    # record -> whatever we are auth

    # restaurant.user == current_user
    record.user == user || user.admin
  end

  def create?
    user.admin
  end

  def destroy?
    record.user == user || user.admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
