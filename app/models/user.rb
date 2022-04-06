class User < ApplicationRecord
  validates_uniqueness_of :email
  has_secure_password
  
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password_digest

  
end
