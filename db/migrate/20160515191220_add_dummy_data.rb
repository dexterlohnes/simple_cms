class AddDummyData < ActiveRecord::Migration
  
  def up
  	AdminUser.create :username => "dlohnes", :first_name => "Dexter", :last_name => "Lohnes"
  	AdminUser.create :username => "jsenyak", :first_name => "Jericha", :last_name => "Senyak"

  	Subject.create :name => "Initial Subject", :visible => true
  	Subject.create :name => "Second Subject", :visible => true

  	Page.create :name => "First Page", :visible => true, :permalink => "first", :position => 1
  	Page.create :name => "Second Page", :visible => true, :permalink => "second", :position => 1
  	Page.create :name => "Third Page", :visible => true, :permalink => "third", :position => 1
  end

  def down
  	# Destroy admins
  	destroy_objects_named ["dlohnes", "jsenyak"], AdminUser

  	# Destroy subjects
  	destroy_objects_named ["Initial Subject", "Second Subject"], Subject

  	# Destroy pages
  	destroy_objects_named ["First Page", "Second Page", "Third Page"], Page
  end


  ### Helpers ###

  def destroy_objects_named(names, objectClass)
  	names.each {  |name|
  		destroy_object_named(name, objectClass)
  	}
  end

  def destroy_object_named(name, objectClass)
  	objectClass.search(name).each { |object| 
  		unless object == nil then object.destroy else puts "ERROR: Couldn't find #{name} for destroy" end
  	}
  	
  end
end
