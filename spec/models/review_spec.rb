require 'rails_helper'

describe Review do
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:stars)}
  it {should validate_uniqueness_of(:user_id)} # user can only review one business
  it {should belong_to(:user)}
  it {should belong_to(:business)}
  it {should validate_numericality_of(:stars).only_integer}
end

