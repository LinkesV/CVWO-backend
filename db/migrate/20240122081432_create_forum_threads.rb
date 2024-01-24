class CreateForumThreads < ActiveRecord::Migration[7.1]
  def change
    create_table :forum_threads do |t|
      t.string :title
      t.string :body
      t.string :category
      t.string :username
      t.integer :userid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
