# require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	has_many :tasks, as: :taskable


	def self.confirm(email,pswrd)
		user = User.find_by({email: email})
		if user
			user.authenticate(pswrd)
		else
			false
		end
	end

end
