class Product < ApplicationRecord

  # has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :product_photos, dependent: :destroy
  has_many :comments
  belongs_to :category
  belongs_to :exhibitor_user ,class_name: "User"
  belongs_to :buyer_user ,class_name: "User", optional: true

  accepts_nested_attributes_for :product_photos, allow_destroy: true

  enum status: { 新品・未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
  enum bear: { 送料込み（出品者負担）: 0, 着払い（購入者負担）: 1}
  enum days: { １〜２日で発送: 0, ２〜３日で発送: 1, ４〜７日で発送: 2}

end
