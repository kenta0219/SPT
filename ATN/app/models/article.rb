class Article < ApplicationRecord

	belongs_to :tag
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :ngvideos

	validates :title, :video, :presence => true
	mount_uploader :video, VideoUploader

end
