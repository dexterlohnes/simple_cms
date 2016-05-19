class Page < ActiveRecord::Base

	belongs_to :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	scope :search, lambda { |query| 
		where (["name LIKE ?", "%#{query}%"]) }
		
end
