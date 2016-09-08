class CreateProfileFunctionalities < ActiveRecord::Migration
  def change
    create_table :profile_functionalities do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :functionality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
