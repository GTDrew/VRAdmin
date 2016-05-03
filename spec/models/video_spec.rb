require 'rails_helper'

RSpec.describe Video, type: :model do

  before(:each) do
    @video = FactoryGirl.build(:video)
  end

  it "has a valid factory" do
    expect(@video).to be_valid
  end

  # it "must have a name" do
  #   @video.name = ""
  #   expect(@video).to be_invalid
  # end

end
