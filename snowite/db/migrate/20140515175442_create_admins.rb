class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_hash
      t.text :bio

      t.timestamps
    end
  end
end
