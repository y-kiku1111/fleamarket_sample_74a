class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  
  validates :nickname, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  validates :first_name, format: { with: /\A[一-龥ぁ-ん]/}
  validates :last_name, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_name_furigana, format: { with: /\A[あ-んー－]+\z/ }
  validates :last_name_furigana, format: { with: /\A[あ-んー－]+\z/ }
  validates :birthday, presence: true


  has_many :likes
  has_many :saling_items, foreign_key: "exhibitor_user_id", class_name: "Product" 
  has_many :saling_items, foreign_key: "buyer_user_id", class_name: "Product" 
  has_many :comments
  has_many :cards
  has_one :address

end
