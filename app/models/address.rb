class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :prefecture_id,:city,:postal_code,:other, presence: true

  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
end
