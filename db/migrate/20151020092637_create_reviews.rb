class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :stars
      t.integer :user_id
      t.integer :business_id
      t.timestamps
    end
  end
end
