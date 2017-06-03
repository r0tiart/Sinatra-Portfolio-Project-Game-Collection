class Character < ActiveRecord::Base
	belongs_to :game
	belongs_to :user

	include Slugable::InstanceMethods
	extend Slugable::ClassMethods 
end