class Role
  def self.roles
    new.to_h
  end

  def self.role(key)
    self.roles[key.to_sym] if key
  end

  def to_a(loader = YAML)
    @roles ||= loader.load(File.open("#{Rails.root}/config/roles.yml"))["roles"].sort.map(&:to_sym)
  end

  def to_h
    to_a.inject([]) do |hash, role|
      hash << [
        role,
        [
          I18n.t("roles.#{role}", default: '').strip,
          I18n.t("activerecord.models.#{role}", count: :many, default: '').strip,
          I18n.t("activemodel.models.#{role}", count: :many, default: '').strip,
          I18n.t("virtual_model.models.#{role}", count: :many, default: '').strip,
          role.to_s.strip
        ].reject(&:blank?).first
      ]

      hash
    end.sort{ |a1, a2| a1.second <=> a2.second }.to_h
  end
end
