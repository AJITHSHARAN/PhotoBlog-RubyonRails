class Post < ApplicationRecord
	belongs_to :user
	has_many   :likes
	has_many   :user_comments
	validates_presence_of   :title, :image_url, :iso, :shutterspeed, :aperture 
end