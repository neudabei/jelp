class CreateCategoryTables < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :business_categories do |t|
      t.integer :category_id
      t.integer :business_id
      t.timestamps
    end
  end
end
