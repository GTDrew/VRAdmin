FactoryGirl.define do
  factory :app do
    name                Faker::Name.first_name
    icon                Faker::Name.last_name
    header_image        Faker::Placeholdit.image
    splash_image        Faker::Placeholdit.image
    background_color    Faker::Color.hex_color
    font_color          Faker::Color.hex_color
  end
end
