FactoryGirl.define do
  factory :video do
    name            Faker::Name.first_name
    description     Faker::Name.last_name
    image           Faker::Placeholdit.image
    video_file      'video.mp4'
    format          true
  end
end
