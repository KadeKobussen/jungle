require 'rails_helper'

RSpec.describe user, type: :model do
  describe 'Validations' do
   before do
     @user = @user.build(
       email: 'Test.Mctest@test.com',
       password: 'pass',
       password_confirmation: 'pass'
       first_name:'test',
       last_name: 'McTest'        
     )
   end

   it 'password is at least 8 chars' do

   end

   it '' do

   end

   it '' do

   end

   it '' do

   end

   it '' do

   end

   it '' do

   end

   it '' do

   end



end
