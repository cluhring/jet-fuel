class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
  validates :first_name, :last_name, :password, :phone, presence: true
  validates :country_code, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
