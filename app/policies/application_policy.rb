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
  end

  def index?
    can_list?
  end

  def say_hello?
    can_say_hello?
  end

  def show?
    can_show?
  end

  def create?
    can_create?
  end

  def new?
    create?
  end

  def update?
    can_update?
  end

  def edit?
    update?
  end

  def destroy?
    can_destroy?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def permission
    @permission ||= user.permission(role_name)
  end

  protected

  def can_say_hello?
    permission.can_read?
  end

  def can_list?
    permission.can_read?
  end

  def can_show?
    scope.where(:id => record.id).exists? && permission.can_read?
  end

  def can_create?
    permission.can_create?
  end

  def can_update?
    permission.can_update?
  end

  def can_destroy?
    permission.can_delete?
  end
end
