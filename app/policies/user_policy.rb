class UserPolicy < ApplicationPolicy

  def index?
    user.admin? or user.manager?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
