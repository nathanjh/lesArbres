class CreateVotes < ActiveRecord::Migration
  def change
      create_table :votes do |t|
         t.references :votable, polymorphic: true, index: true
         t.string :user_id
         t.integer :value

         t.timestamps null: false
      end
  end
end
