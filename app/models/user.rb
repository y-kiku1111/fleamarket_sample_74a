class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :products
  has_many :comments
  has_many :cards
  has_one :address

  mount_uploader :profile_photo, ImgNameUploader
end
