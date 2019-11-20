class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # record.user == user
    return true
  end

  def show?
    return true
  end

  def edit?
    return true
    # record.user == user
  end

  def destroy?
    return true
    # record.user == user
  end

  def new?
    return true
    # record.user == user
  end
end
