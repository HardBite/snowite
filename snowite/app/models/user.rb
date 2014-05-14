class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :fname, :lname, :bio, :email, :password, :password_confirmation

  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password

  #after_save
  #session[:user_id]=user[:id]

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def login(email, enquired_password)
    @user = User.find_by_email(email)
    binding.pry
    if @user.password == enquired_password
      @user
    else
      nil
    end
  end

      




end
