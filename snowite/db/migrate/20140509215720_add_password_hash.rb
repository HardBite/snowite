class AddPasswordHash < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :password_hash
    end
  end

  def down
  end
end
