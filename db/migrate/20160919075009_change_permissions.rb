class ChangePermissions < ActiveRecord::Migration
  def change
    revert do
      add_column :permissions, :can_create, :boolean, default: false
      add_column :permissions, :can_read,   :boolean, default: false
      add_column :permissions, :can_update, :boolean, default: false
      add_column :permissions, :can_delete, :boolean, default: false
    end

    add_column :permissions, :action, :string, null: false, default: ''
    add_column :permissions, :permit, :boolean, default: false
  end
end
