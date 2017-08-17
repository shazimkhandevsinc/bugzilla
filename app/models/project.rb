class Project < ApplicationRecord

  has_many :assign_projects , dependent: :destroy
  has_many :users, through: :assign_projects

  accepts_nested_attributes_for :users

  has_many :bugs

end
