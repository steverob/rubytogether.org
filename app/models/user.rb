class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def member?
    member_until && member_until > Time.now
  end

private

  # Normally this method requires a password all the time. In this app,
  # we want the password to be optional at signup, but never removable.
  def password_required?
    !password.nil?
  end

end
