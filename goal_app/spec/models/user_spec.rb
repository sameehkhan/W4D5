# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Test User validations' do 
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
  end 
  
  context 'Validates password length' do 
    it { should validate_length_of(:password).is_at_least(6) }
  end 
  
  context 'User has many' do 
    it { should have_many(:goals)}
    it { should have_many(:comments)}
  end
  
  context 'Find by credentials' do 
    subject(:jerrick) { User.create!(username: 'Jerrick', password: 'password')}
    
    it 'should be able to find by credentials' do 
      user = User.find_by_credentials('Jerrick', 'password')
      expect(user.username).to eq(jerrick.username)
    end 
  end
end
  
