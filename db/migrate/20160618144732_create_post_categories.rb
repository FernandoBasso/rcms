class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :title, limit: 64
      t.string :description, limit: 200
      t.string :slug, limit: 64

      t.timestamps null: false
    end
  end
end
