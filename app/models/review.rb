class Review < ActiveRecord::Base
  validates_presence_of :body, :stars
  belongs_to :user
  belongs_to :business

  default_scope { order('created_at DESC') }
  validates_numericality_of :stars, {only_integer: true}
  validates_uniqueness_of :user_id, scope: :business_id
end