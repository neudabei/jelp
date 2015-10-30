class Business < ActiveRecord::Base
  validates_presence_of :name
  has_many :reviews
  has_many :business_categories
  has_many :categories, through: :business_categories
  belongs_to :user
end