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

  after_create :generate_code

  validates :code, uniqueness: true
  CHARS = [*'A'..'Z'] + [*0..9]

  def generate_code
    code = CHARS.sample(5).join('')

    if self.class.exists?(code: code)
      generate_code
    else
      self.code = code
      self.save
    end
  end

  include CarrierWave::MiniMagick

  attr_accessor :header_image_width, :header_image_height

  validate :validate_minimum_header_size, 
           :validate_minimum_splash_size,
           :validate_minimum_icon_size

  def validate_minimum_header_size
    header_image = MiniMagick::Image.open(self.header_image.path)
    unless header_image[:width] > 918 && header_image[:height] > 256
      errors.add :header_image, "should be 918 x 256px minimum!" 
    end
  end

  def validate_minimum_splash_size
    splash_image = MiniMagick::Image.open(self.splash_image.path)
    unless splash_image[:width] > 1920 && splash_image[:height] > 1080
      errors.add :splash_image, "should be 1920 x 1080px minimum!" 
    end
  end

  def validate_minimum_icon_size
    icon = MiniMagick::Image.open(self.icon.path)
    unless icon[:width] > 512 && icon[:height] > 512
      errors.add :icon, "should be 512 x 512px minimum!" 
    end
  end

end
