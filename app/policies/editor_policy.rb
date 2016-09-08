class EditorPolicy < ApplicationPolicy

  def all?
    user&.editor? or user&.admin?
  end

  # def index?
  #   user.editor? or user.admin?
  # end
  #
  # def show?
  #   user.editor? or user.admin?
  # end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
