FactoryGirl.define do
  factory :video do
    name            Faker::Lorem.word
    description     Faker::Lorem.sentence
    thumbnail       'image.png'
    video_file      'video.mp4'
    format          true
    visibility      true
  end
end
