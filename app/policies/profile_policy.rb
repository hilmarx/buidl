class ProfilePolicy < ApplicationPolicy
  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user && !user.nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
