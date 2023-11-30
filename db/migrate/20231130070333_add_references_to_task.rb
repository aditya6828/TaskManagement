class AddReferencesToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :admin, null: false, foreign_key: true
    add_reference :tasks, :manager, null: false, foreign_key: true
    add_reference :tasks, :employee, null: false, foreign_key: true
  end
end
