class Admin < ActiveRecord::Base
  attr_accessible :, :bio, :fname,lname,email,password_hash, :text
end
