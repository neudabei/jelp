class User < ActiveRecord::Base
  validates_presence_of :full_name, :email, :password
  validates_uniqueness_of :email
  has_many :reviews
  has_many :businesses
  
  has_secure_password validations: false
end