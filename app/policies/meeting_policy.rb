class MeetingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def show?
      true
    end
  end
end
