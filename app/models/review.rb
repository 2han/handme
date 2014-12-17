class Review < ActiveRecord::Base
	belongs_to :reviewing, :class_name => "User"
	belongs_to :reviewed, :class_name => "User"
end
