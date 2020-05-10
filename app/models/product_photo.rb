class ProductPhoto < ApplicationRecord
  belongs_to :product

  mount_uploader :photo, ImgNameUploader
end
