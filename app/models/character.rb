class Character < ActiveRecord::Base
	belongs_to :game

	include Slugable::InstanceMethods
	extend Slugable::ClassMethods 
end