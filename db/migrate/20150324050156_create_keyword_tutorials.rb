class CreateKeywordTutorials < ActiveRecord::Migration
  def change
    create_table :keyword_tutorials do |t|
      t.integer :tutorial_id
      t.integer :keyword_id

      t.timestamps null: false
    end
  end
end
