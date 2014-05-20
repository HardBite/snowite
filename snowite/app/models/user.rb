class User < ActiveRecord::Base
  include BCrypt

  belongs_to :role

  attr_accessible :fname, :lname, :bio, :email, :password, :password_confirmation, :role_id
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
    @user = User.find_by_email(email)
    if @user && @user.password == enquired_password
      @user
    else
      nil
    end
  end

      




end
