class AddUserInfo < ActiveRecord::Migration
  def up
      change_table :users do |t|
        t.string :fname
        t.string :lname
        t.string :email
        t.text :bio
      end
  end


  def down
  end
end
