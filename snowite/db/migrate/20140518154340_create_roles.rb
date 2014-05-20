class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :rolename 
      t.timestamps
    end

    change_table :users do |t|
      t.belongs_to :role
    end

    change_table :admins do |t|
      t.belongs_to :role
    end

  end
end
