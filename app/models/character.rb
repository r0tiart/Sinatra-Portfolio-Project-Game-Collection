class Character < ActiveRecord::Base
	belongs_to :game
	belongs_to :user

	validates :name, presence: true
	validates :klass, presence: true
	validates :level, presence: true

	include Slugable::InstanceMethods
	extend Slugable::ClassMethods 
end