class Article < ApplicationRecord

	validates :title, :video, :presence => true
end
