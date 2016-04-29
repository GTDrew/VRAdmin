class Video < ActiveRecord::Base
  belongs_to :app

  default_scope { order("rank ASC") }
end
