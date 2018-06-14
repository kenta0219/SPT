class Video < ApplicationRecord
	has_many :comment
	has_many :video_merger
	has_many :tag_merger

	attachment :video

	mount_uploader :video, VideoUploader
end
