class Blog < ApplicationRecord
   extend FriendlyId
  friendly_id :title, use: :slugged

	# validates :title, presence: true
  validates :title, length: { minimum: 1 }
	validates :body, presence: true
	validates :user_id, numericality: true
  # validates :image, presence: true
  # validates :tag_list, presence: true


	belongs_to :user
	belongs_to :category

	has_many :blog_tags 
	has_many :tags, through: :blog_tags
  has_one_attached :image
  has_rich_text :body

  accepts_nested_attributes_for :blog_tags, allow_destroy: true




  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end