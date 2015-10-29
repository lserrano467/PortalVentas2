class Category < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :features

	def self.search(query)
    # where(:category, query) -> This would return an exact match of the query
    	where("name like ?", "%#{query}%") 
  	end
end
