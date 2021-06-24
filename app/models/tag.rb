class Tag < ApplicationRecord
	extend FriendlyId
    friendly_id :name, use: :slugged
	has_many :blog_tags
	has_many :blogs, through: :blog_tags
	
		
end
