class AdduserIdToreviewTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :review_tasks, :user_id, :string

  end
end
