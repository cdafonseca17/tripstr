class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user == user
  end

  def show?
    return true
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def new?
    return true
  end
end
