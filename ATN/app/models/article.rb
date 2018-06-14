class Article < ApplicationRecord

	validates :title, :video, :presence => true
	mount_uploader :video, VideoUploader
end
