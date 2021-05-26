class Blog < ApplicationRecord

	# validates :title, presence: true
  validates :title, length: { minimum: 1 }
	validates :body, presence: true
	validates :user_id, numericality: true

	belongs_to :user
	belongs_to :category

	has_many :blog_tags
	has_many :tags, through: :blog_tags


end