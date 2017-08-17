class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :assign_projects , dependent: :destroy
  has_many :projects, through: :assign_projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #attr_accessor :name, :email, :password, :password_confirmation,:user_type, :remember_me, :profile, :profile_cache , :remove_profile

  mount_uploader :profile , ProfileUploader
  # User Avatar Validation
  validates_integrity_of  :profile
  validates_processing_of :profile

  private
  def profile_size_validation
    errors[:profile] << "should be less than 500KB" if profile.size > 0.5.megabytes
  end

end
