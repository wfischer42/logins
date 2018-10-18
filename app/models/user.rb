class User < ApplicationRecord
  validates_presence_of :email_address, :full_name, :password
  validates_uniqueness_of :email_address

  def self.authenticate(credentials)
    user = User.find_by(credentials)
  end

  def session_attributes
    { "full_name" => full_name,
      "id" => id,
      "email_address" => email_address }
  end
end
