class AdminUser < ActiveRecord::Base

	scope :search, lambda { |query| 
		where (["username LIKE ?", "%#{query}%"]) }

end
