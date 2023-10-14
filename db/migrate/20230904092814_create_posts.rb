class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :country
      t.string :city
      t.string :school
      t.string :video

      t.timestamps
    end
  end
end
