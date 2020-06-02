require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Saves a user' do
      user = User.new(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      user.save
      expect(user).to be_valid
    end

    it 'Does not save user if password and password confirmation do not match' do
      user = User.new(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'b')
      user.save
      expect(user).to_not be_valid
    end

    it 'Does not save user when password is too short' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: '', password_confirmation: '')
      expect(@user.errors[:password]).to include("is too short (minimum is 1 character)")
    end

    it 'Does not save user when email already exists' do
      @user1 = User.create(first_name: 'a', last_name: 'a', email:'A@a.com', password: 'a', password_confirmation: 'a')
      @user2 = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(@user2).to_not be_valid
    end

   
  end


  describe '.authenticate_with_credentials' do
    it 'Will return a user if given correct info' do
      user = User.new(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      user.save
      expect(User.authenticate_with_credentials("a@a.com", "a")).to eq(user)
    end

    it 'Will return nil if given incorrect info' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      expect(User.authenticate_with_credentials("a@a.com", "b")).to be_nil
    end

    it 'Will return a user when given correct info with spaces in the email' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      @user.save
      expect(User.authenticate_with_credentials("    a@a.com   ", "a")).to eq(@user)
    end

    it 'Will return a user when given info with random capitalization in the email' do
      @user = User.create(first_name: 'a', last_name: 'a', email:'a@a.com', password: 'a', password_confirmation: 'a')
      @user.save
      expect(User.authenticate_with_credentials("A@a.CoM", "a")).to eq(@user)
    end

  end

   

  
end