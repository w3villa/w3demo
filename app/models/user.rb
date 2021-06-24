class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs
  has_many :hobbies
  accepts_nested_attributes_for :hobbies, allow_destroy: true, :reject_if => proc { |attributes| attributes['name'].blank? }

end
