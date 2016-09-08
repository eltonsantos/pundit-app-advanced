class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :manager
  belongs_to :editor
  belongs_to :profile
  belongs_to :father, class_name: "User"

  # Método para saber se é admin
  def admin?
    self.admin == true
  end

  # Método para saber se é manager
  def manager?
    !self.manager_id.blank? && self.editor_id.blank? && self.admin == false
  end

  # Método para saber se é editor
  def editor?
    self.manager_id.blank? && !self.editor_id.blank? && self.admin == false
  end

end
