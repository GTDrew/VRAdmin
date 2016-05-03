class Video < ActiveRecord::Base
  belongs_to :app

  default_scope { order("rank ASC") }

  mount_uploader :thumbnail, VideoThumbnailUploader
  mount_uploader :video_file, VideoUploader

  validates_presence_of :name,
                        :description,
                        :video_file,
                        :thumbnail
end
