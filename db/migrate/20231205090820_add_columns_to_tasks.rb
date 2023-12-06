class AddColumnsToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :assign_to, :string
    add_column :tasks, :status, :string
  end
end
