class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :body
      t.integer :userid
      t.integer :postid
      t.references :user, null: false, foreign_key: true
      t.references :forum_thread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
