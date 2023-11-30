class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :user_type
      t.string :password_digest

      t.timestamps
    end
  end
end
