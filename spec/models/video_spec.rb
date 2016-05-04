require 'rails_helper'
require 'factory_girl_rails'

describe Video do

  before(:each) do
    @video = FactoryGirl.build(:video)
    @user = FactoryGirl.build(:user)
    @app = FactoryGirl.build(:app)
  end

  it "has a valid factory" do
    expect(@video).to be_valid
  end

  # it "must have a name" do
  #   @video.name = ""
  #   expect(@video).to be_invalid
  # end

end
