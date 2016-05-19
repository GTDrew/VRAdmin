require 'rails_helper'
require 'factory_girl_rails'

describe User do
  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  it 'has a valid factory' do
    expect(@user).to be_valid
  end

  it 'must have a first name' do
    @user.first_name = ''
    expect(@user).to be_invalid
  end

  it 'must have a last name' do
    @user.last_name = ''
    expect(@user).to be_invalid
  end

  it 'must have an email' do
    @user.email = ''
    expect(@user).to be_invalid
  end

  it 'first name contains only letters' do
    @user.first_name = 'John!'
    expect(@user).to be_invalid
  end

  it 'last name contains only letters' do
    @user.last_name = 'Doe?'
    expect(@user).to be_invalid
  end

  it 'first name must be longer than 2 characters' do
    @user.first_name = 'D'
    expect(@user).to be_invalid
  end

  it 'last name must longer than 2 characters' do
    @user.last_name = 'D'
    expect(@user).to be_invalid
  end

  it 'first name may have a space after first character' do
    @user.first_name = 'Mary Anne'
    expect(@user).to be_valid
  end
end
