class Institution < ActiveRecord::Base
 #attr_accessible :name

validates :name, :presence => true

has_many   :institcourses
has_many   :coursenames, :through => :institcourses
end

