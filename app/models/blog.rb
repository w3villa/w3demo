class Blog < ApplicationRecord
   extend FriendlyId
  friendly_id :title, use: :slugged

	# validates :title, presence: true
  validates :title, length: { minimum: 1 }
	validates :body, presence: true
	validates :user_id, numericality: true
  validates :image, presence: true
  validates :tag_ids, presence: true


	belongs_to :user
	belongs_to :category

	has_many :blog_tags 
	has_many :tags, through: :blog_tags
  has_one_attached :image
  has_rich_text :body

 


end