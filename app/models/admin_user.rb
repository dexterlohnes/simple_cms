class AdminUser < ActiveRecord::Base

	has_and_belongs_to_many :pages
	has_many :section_edits
	# Reach 'through' :section_edits to get :sections
	has_many :sections, :through => :section_edits

	scope :search, lambda { |query| 
		where (["username LIKE ?", "%#{query}%"]) }

end
