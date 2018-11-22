class ContributionPolicy < ApplicationPolicy

  def destroy?
    record.first.profile.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
