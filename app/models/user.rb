class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  validates :email, format:{with:  /\A^[a-z0-9._+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i, on: :create}
  validates :password, confirmation: true
end
