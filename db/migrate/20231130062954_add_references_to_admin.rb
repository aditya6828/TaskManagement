class AddReferencesToAdmin < ActiveRecord::Migration[7.1]
  def change
    add_reference :admins, :manager, null: false, foreign_key: true
    add_reference :admins, :employee, null: false, foreign_key: true
    add_reference :admins, :task, null: false, foreign_key: true
  end
end
