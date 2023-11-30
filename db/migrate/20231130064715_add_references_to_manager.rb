class AddReferencesToManager < ActiveRecord::Migration[7.1]
  def change
    add_reference :managers, :admin, null: false, foreign_key: true
    add_reference :managers, :employee, null: false, foreign_key: true
    add_reference :managers, :task, null: false, foreign_key: true
  end
end
