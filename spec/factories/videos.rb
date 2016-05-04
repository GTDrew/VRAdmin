FactoryGirl.define do
  factory :video do
    name            Faker::Name.first_name
    description     Faker::Name.last_name
    thumbnail       Faker::Placeholdit.image
    video_file      "video.mp4"
    format          true
    visibility      true
  end
end
