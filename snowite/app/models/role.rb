class Role < ActiveRecord::Base
  has_many :users
  has_many :admins
  
  attr_accessible :rolename

end
