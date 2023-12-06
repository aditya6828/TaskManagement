class AddassignToToreviewTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :review_tasks, :assign_to, :string
  end
end
