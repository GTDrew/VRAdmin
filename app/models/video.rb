class Video < ActiveRecord::Base
  belongs_to :app

  enum format: [:stereoscopic, :monoscopic]

  default_scope { order('rank ASC') }

  mount_uploader :image, VideoImageUploader
  mount_uploader :video_file, VideoUploader

  # validates_presence_of :name,
  # :description,
  # :video_file,
  # :image

  validates :video_file, presence: true

  def to_jq_upload
    {
      'name' => read_attribute(:video_file),
      'size' => video_file.size,
      'url' => video_file.url
    }
  end
end
