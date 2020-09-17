class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :watched_on
      t.string :theater
      t.text :comment

      t.timestamps
    end
  end
end
