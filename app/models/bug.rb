class Bug < ApplicationRecord
  belongs_to :project

  validates :title,
      presence: true,
      uniqueness: true
  validates :status,
      presence: true
  validates :bug_type,
      presence: true



  mount_uploader :screenshot , ScreenshotUploader

  # User Avatar Validation
  validates_integrity_of  :screenshot
  validates_processing_of :screenshot

  private

  def screenshot_size_validation
    errors[:screenshot] << "should be less than 500KB" if screenshot.size > 0.5.megabytes
  end




end
