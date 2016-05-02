require "administrate/base_dashboard"

class VideoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    app: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    thumbnail: Field::String,
    video_file: Field::String,
    format: Field::Boolean,
    visibility: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    rank: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :app,
    :name,
    :created_at,
    :updated_at
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :app,
    :id,
    :name,
    :description,
    :thumbnail,
    :video_file,
    :format,
    :visibility,
    :created_at,
    :updated_at,
    :rank,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :app,
    :name,
    :description,
    :thumbnail,
    :video_file,
    :format,
    :visibility,
    :rank,
  ]

  # Overwrite this method to customize how videos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(video)
  #   "Video ##{video.id}"
  # end
end
