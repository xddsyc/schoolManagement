class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true, length: { minimum: 4}
	validates :password, presence: true, length: { minimum: 6}
	validates :name, uniqueness: true
end
