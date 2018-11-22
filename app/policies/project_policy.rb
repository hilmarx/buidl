class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def update?
    # Only users that contriuted to the project are allowed to update
    record.contributions.where(profile_id: user.profile.id).first.profile_id == user.profile.id && !user.nil?
  end


end
