class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :s_no
      t.string :description
      t.integer :tutorial_id

      t.timestamps null: false
    end
  end
end
