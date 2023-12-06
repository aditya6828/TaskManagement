class AddColumnsToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :manager_id, :string
    add_column :tasks, :admin_id, :string
  end
end
