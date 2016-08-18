class EditorPolicy < ApplicationPolicy

  def index?
    user.editor? or user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
