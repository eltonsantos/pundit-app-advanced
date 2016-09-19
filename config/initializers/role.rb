class Role
  def self.roles
    new.to_h
  end

  def self.role(role_name)
    self.roles[:"#{role_name}"]
  end

  def self.action(role, action)
    {
      action: action.to_sym,
      label: [
        I18n.t("roles.actions.#{role}.#{action}", default: '').strip,
        I18n.t("roles.actions.#{action}", default: '').strip,
        "#{action}".strip
      ].reject(&:blank?).first
    }
  end


  def self.to_a
    new.to_a
  end

  def initialize(loader = YAML)
    role = loader.load(File.open("#{Rails.root}/config/roles.yml"))["role"]
    default_actions = role["actions"]

    self.roles = role["roles"].inject({}) do |memo, values|
      role_name, role_actions = []

      values.each do |name, actions|
        role_name = name.to_sym
        role_actions = [actions].flatten
      end

      memo[role_name] ||= {}
      memo[role_name][:role] ||= role_name
      memo[role_name][:label] = [
        I18n.t("roles.#{role_name}", default: '').strip,
        I18n.t("activerecord.models.#{role_name}", count: :many, default: '').strip,
        I18n.t("activemodel.models.#{role_name}", count: :many, default: '').strip,
        "#{role_name}".strip
      ].reject(&:blank?).first
      memo[role_name][:actions] ||= []
      memo[role_name][:actions] += begin
                                     actions = (default_actions + role_actions)
                                     actions = actions.reject(&:blank?)
                                     actions = actions.map(&:to_sym)

                                     actions
                                   end

      memo[role_name][:actions].uniq!

      memo
    end
  end

  def to_a
    roles.map do |_, role|
      [ role[:role], role[:label] ]
    end.sort{ |a1, a2| a1.second <=> a2.second }
  end

  def to_h
    roles.dup
  end

  protected

  attr_accessor :roles
end
