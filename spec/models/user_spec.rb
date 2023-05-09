require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before do
      @user = User.new(
        email: 'Test.Mctest@test.com',
        password: '123456789',
        password_confirmation: '123456789',
        first_name:'test',
        last_name: 'McTest'        
      )
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid with no email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with no password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with a password confirmation that does not match the password' do
      @user.password_confirmation = '1123456789'
      expect(@user).to_not be_valid
    end

    it 'is not valid with no first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with no last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with a duplicate email (case-insensitive)' do
      @user.save
      new_user = User.new(
        email: 'Test.Mctest@test.com',
        password: '123456789',
        password_confirmation: '123456789',
        first_name:'test',
        last_name: 'McTest'        
      )
      expect(new_user).to_not be_valid
    end

    it 'is not valid with a password shorter than 8 characters' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      @user.save
    end
  end
end
