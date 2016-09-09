class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :role
      t.boolean :can_create, default:false
      t.boolean :can_read, default:false
      t.boolean :can_update, default:false
      t.boolean :can_delete, default:false

      t.timestamps null: false
    end
  end
end
