class Product < ApplicationRecord

  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :product_photos
  has_many :comments
  belongs_to :category
  belongs_to :user
  belongs_to :brand
end
