class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :saling_items, foreign_key: "exhibitor_user_id", class_name: "Product" 
  has_many :saling_items, foreign_key: "buyer_user_id", class_name: "Product" 
  has_many :comments
  has_many :cards
  has_one :address

end
