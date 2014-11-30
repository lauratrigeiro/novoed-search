class User < ActiveRecord::Base

	def self.search(filter, query)
		where("#{filter} ILIKE ?", "%#{query}%")
	end
end
