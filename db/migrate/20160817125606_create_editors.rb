class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :description
      t.references :manager, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
