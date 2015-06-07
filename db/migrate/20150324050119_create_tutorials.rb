class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.integer :tutorial_level
      t.integer :user_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
