## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_furigana|string|null: false|
|last_name|string|null: false|
|last_name_furigana|string|null: false|
|profile_photo|string|null: false|
|tel_number|string|null: false|
|introduction|text|
|address|reference|foreign_key: true, null: false|
|photo|reference|foreign_key: true, null: false|

### Association
- has_many :likes
- has_many :products
- has_many :comments
- has_many :cards
- belongs_to :address
- belongs_to :photo


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|status|integer|null: false|
|bear|integer|null: false|
|days|integer|null: false|
|user|reference|foreign_key: true, null: false|
|category|reference|foreign_key: true, null: false|

### Association
- has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
- has_many :product_photos
- has_many :photos,  through:  :product_photos
- has_many :comments
- has_many :categories
- belongs_to :user
- belongs_to :brand


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|city|string|null: false|
|other|string|null: false|
|building_name|string|

### Association
- belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true, null: false|
|product|reference|foreign_key: true, null: false|

### Association
- belongs_to :product
- belongs_to :user


## photosテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|

### Association
- has_many :users
- has_many :product_photos
- has_many :products,  through:  :product_photos


## product_photosテーブル

|Column|Type|Options|
|------|----|-------|
|product|reference|foreign_key: true, null: false|
|photo|reference|foreign_key: true, null: false|

### Association
- belongs_to :product
- belongs_to :photo


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|reference|foreign_key: true, null: false|
|product|reference|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :product


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|foreign_key: true, null: false|

### Association
- belongs_to :product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product|reference|foreign_key: true, null: false|

### Association
- has_many :product

