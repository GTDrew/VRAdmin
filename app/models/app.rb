class App < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  has_many :videos

  validates :background_color, length: { is: 7 }
  validates :font_color, length: { is: 7 }

  validates :name,
            presence: true,
            uniqueness: true,
            length: { maximum: 12 }

  mount_uploader :icon, AppIconUploader
  mount_uploader :header_image, AppHeaderUploader
  mount_uploader :splash_image, AppSplashUploader

end
