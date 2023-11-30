class AddReferencesToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :admin, null: false, foreign_key: true
    add_reference :employees, :manager, null: false, foreign_key: true
    add_reference :employees, :task, null: false, foreign_key: true
  end
end
