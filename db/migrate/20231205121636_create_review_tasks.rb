class CreateReviewTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :review_tasks do |t|
      t.string :task_id
      t.string :title
      t.string :description
      t.string :status
      t.string :manager_id
      t.string :admin_id

      t.timestamps
    end
  end
end
