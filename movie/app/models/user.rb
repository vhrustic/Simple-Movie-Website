require 'bcrypt'

class User < ApplicationRecord
	include BCrypt
	after_validation :encrypt_password

	validates :username, presence: true, length: {maximum: 40}
	validates :email, presence: true, length: {maximum: 50}, email_format: { message: "Email you entered doesn't look like an email address." }
	validates :password, presence: true
	validates_confirmation_of :password
  	validates_presence_of :password, :on => :create
  	validates_uniqueness_of :email, :username

  	private
		def encrypt_password
			if self.password.present?
				self.password = Password.create(@password)
			end
		end
end
