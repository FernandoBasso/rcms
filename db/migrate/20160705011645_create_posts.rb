class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 128
      t.string :intro, limit: 200
      t.text :text
      t.references :post_category, foreign_key: true

      t.timestamps
    end
  end
end
