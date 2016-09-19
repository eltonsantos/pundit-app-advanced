class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  attr_reader :user, :record, :role_name

  def initialize(user, record)
    @user = user
    @record = record
    @role_name = "#{self.class}".sub(/Policy/, '').tableize.singularize
    @permission = {}
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def method_missing(method, *args, &block)
    if "#{method}" =~ /\A.+\?\z/
      action = "#{method}".sub(/\A(.+)\?\z/, '\1')

      permission(action).permit?
    else
      super
    end
  end

  protected

  def permission(action)
    @permission[action] ||= user.permission(role_name, action)
  end
end
