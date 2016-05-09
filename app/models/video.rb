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

end
