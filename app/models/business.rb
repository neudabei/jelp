class Business < ActiveRecord::Base
  validates_presence_of :name
  has_many :reviews
  has_many :business_categories
  has_many :categories, through: :business_categories
  belongs_to :user

  def self.search_by_name(search_term)
    return [] if search_term == ""
    where("name LIKE ?", "%#{search_term}%").order("created_at DESC")
  end
end