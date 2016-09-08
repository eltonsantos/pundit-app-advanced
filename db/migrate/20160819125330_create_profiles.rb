class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :description
      t.references :manager, index: true, foreign_key: true
      t.references :editor, index: true, foreign_key: true
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
