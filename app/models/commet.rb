class Commet < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
