class ManagerPolicy < ApplicationPolicy

  def index?
    user.manager? or user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
