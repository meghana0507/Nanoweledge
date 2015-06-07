class CreateRateUserTutorials < ActiveRecord::Migration
  def change
    create_table :rate_user_tutorials do |t|
      t.integer :tutorial_id
      t.integer :user_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
