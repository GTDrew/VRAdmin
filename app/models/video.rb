class Video < ActiveRecord::Base
  belongs_to :app

  enum format: [ :stereoscopic, :monoscopic ]

  default_scope { order("rank ASC") }

  mount_uploader :image, VideoImageUploader
  mount_uploader :video_file, VideoUploader

  validates_presence_of :name,
                        :description,
                        :video_file,
                        :image

  before_save :update_video_attributes

  private

  def update_video_attributes
    if video_file.present? && video_file_changed?
      self.size = video_file.file.size
    end
  end


end
