class Admin < ActiveRecord::Base
  include BCrypt

  belongs_to :role

  attr_accessible :admincheck, :fname, :lname, :bio, :email, :password, :password_confirmation, :role_id

  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def login(email, enquired_password)
    @admin = Admin.find_by_email(email)
    if @admin && @admin.password == enquired_password
      @admin
    else
      nil
    end
  end

      




end
