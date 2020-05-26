class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :prefecture_id,:city,:postal_code,:other, :send_first_name, :send_last_name,:send_first_name_furigana, :send_last_name_furigana, presence: true
  validates :send_first_name, format: { with: /\A[一-龥ぁ-ん]/}
  validates :send_last_name, format: { with: /\A[一-龥ぁ-ん]/}
  validates :send_first_name_furigana, format: { with: /\A[あ-んー－]+\z/ }
  validates :send_last_name_furigana, format: { with: /\A[あ-んー－]+\z/ }

  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  
end
