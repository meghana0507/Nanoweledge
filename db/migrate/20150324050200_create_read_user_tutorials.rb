class CreateReadUserTutorials < ActiveRecord::Migration
  def change
    create_table :read_user_tutorials do |t|
      t.integer :tutorial_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
