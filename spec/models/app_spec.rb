require 'rails_helper'
require 'factory_girl_rails'

describe App do

  before(:each) do
    @app = FactoryGirl.build(:app)
  end

  it "has a valid factory" do
    expect(@app).to be_valid
  end

  it "must have a first name" do
    @app.name = ""
    expect(@app).to be_invalid
  end

  it "background color must have a hex color code, 7 characters long" do
    @app.background_color = ""
    expect(@app).to be_invalid
  end

  it "font color must have a hex color code, 7 characters long" do
    @app.font_color = ""
    expect(@app).to be_invalid
  end

  it "belongs to a User" do
    @user = FactoryGirl.build(:user)
    @user.save
    @app.user_id = @user.id
    expect(@app.owner).to eq(@user)
  end

end
