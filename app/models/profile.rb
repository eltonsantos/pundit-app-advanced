class Profile < ActiveRecord::Base
  has_many :users
  has_many :profile_functionalities
  has_many :functionalities, through: :profile_functionalities
  belongs_to :manager
  belongs_to :editor
  
end
