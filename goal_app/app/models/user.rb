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

class User < ApplicationRecord
  validates :username, presenece: true, uniqueness: true 
  validates :password_digest, :session_token, presenece: true 
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token
  
  attr_reader :password 

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    @user && @user.is_password?(password) ? @user : nil 
  end
  
  def ensure_session_token
    self.session_token ||= generate_session_token
  end 
  
  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end
  
  def is_password?(password)
    
  end 
  
  def generate_session_token
    
  end
  
  def password=(password)
    
  end
  
end
