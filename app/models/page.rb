class Page < ActiveRecord::Base

	belongs_to :subject

	scope :search, lambda { |query| 
		where (["name LIKE ?", "%#{query}%"]) }
		
end
