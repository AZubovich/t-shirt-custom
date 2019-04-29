class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user
  acts_as_votable
  acts_as_taggable_on :tags
 
end
