class Blog < ApplicationRecord

	# validates :title, presence: true
  	validates :title, length: { minimum: 4 }
	validates :body, presence: true
	validates :user_id, numericality: true
	belongs_to :category

end