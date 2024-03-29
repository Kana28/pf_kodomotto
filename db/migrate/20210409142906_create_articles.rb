class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title
      t.text :body
      t.text :user_image_id

      t.timestamps
    end
  end
end
