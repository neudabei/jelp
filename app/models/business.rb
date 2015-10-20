class Business < ActiveRecord::Base
  validates_presence_of :name
  has_many :reviews
  belongs_to :user
end