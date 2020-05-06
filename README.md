## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_furigana|string|null: false|
|last_name|string|null: false|
|last_name_furigana|string|null: false|
|birthday|date|null: false|
|profile_photo|string|null: false|
|tel_number|string|null: false|
|introduction|text|


### Association
- has_many :likes
- has_many :products
- has_many :comments
- has_many :cards
- has_one :address


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
- has_many :comments
- belongs_to :category
- belongs_to :user
- belongs_to :brand


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|city|string|null: false|
|other|string|null: false|
|building_name|string|
|user|reference|foreign_key: true, null: false|

### Association
- belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|reference|foreign_key: true, null: false|

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


## product_photosテーブル

|Column|Type|Options|
|------|----|-------|
|photo|string|null: false|
|product|reference|foreign_key: true, null: false|

### Association
- belongs_to :product


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
- has_many :products


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :product

