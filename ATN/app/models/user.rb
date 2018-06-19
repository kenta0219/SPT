class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attachment :image

  has_many :post_comments, dependent: :destroy
  has_many :video_merger
  has_many :articles

end
