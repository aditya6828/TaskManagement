class ModifySchema < ActiveRecord::Migration[7.1]
  def change
    # Modify the admins table
    change_table :admins do |t|
      t.remove :manager_id, :employee_id, :task_id
    end

    # Modify the employees table
    change_table :employees do |t|
      t.remove :admin_id, :manager_id, :task_id
    end

    # Modify the managers table
    change_table :managers do |t|
      t.remove :admin_id, :employee_id, :task_id
    end

    # Modify the tasks table
    change_table :tasks do |t|
      t.rename :task_description, :description
      t.remove :admin_id, :employee_id, :manager_id
    end

    # Modify the users table
    change_table :users do |t|
      t.remove :user_type
    end
  end
end
