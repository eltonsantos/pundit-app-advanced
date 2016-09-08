class ManagerPolicy < ApplicationPolicy

  def all?
    user&.manager? or user&.admin?
  end

  # def index?
  #   user.manager? or user.admin?
  # end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
