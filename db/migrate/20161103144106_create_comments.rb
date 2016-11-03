class CreateComments < ActiveRecord::Migration
  def change
      create_table :comments do |t|
         t.references :commentable, polymorphic: true, index: true
         t.text :body, null: false
         t.integer :user_id
         t.timestamps null: false
      end
  end
end
