class EditorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
