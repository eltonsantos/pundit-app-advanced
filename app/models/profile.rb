class Profile < ActiveRecord::Base
  has_many :permissions
  has_many :users
  has_many :profile_functionalities
  has_many :functionalities, through: :profile_functionalities
  belongs_to :manager
  belongs_to :editor

  accepts_nested_attributes_for :permissions
end
