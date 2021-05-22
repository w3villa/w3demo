class Blog < ApplicationRecord

	# validates :title, presence: true
  validates :title, length: { minimum: 10 }
	validates :body, presence: true
	validates :user_id, numericality: true

	belongs_to :user

end