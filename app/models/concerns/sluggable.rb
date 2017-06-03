module Slugable
	module ClassMethods
		def find_by_slug(slug)
		self.all.find{ |instance| instance.slug == slug}
	end
	end

	module InstanceMethods
		def slug
			if !!self.respond_to?("username")
				self.username.downcase.gsub(" ", "-")
			elsif !!self.respond_to?("title")
				self.title.downcase.gsub(" ", "-")
			elsif !!self.respond_to?("name")
				self.name.downcase.gsub(" ", "-")
			end
		end
	end

end
