class User < ActiveRecord::Base

	has_many :votes
	has_many :questions
	has_many :answers 
	has_many :comments, :as => :commentable

   include BCrypt

   def password
      @password ||= Password.new(password_hash) 
      p @password
   end

   def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password 
   end

end