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
end
  
