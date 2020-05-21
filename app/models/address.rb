class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :other, presence: true

  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
end
