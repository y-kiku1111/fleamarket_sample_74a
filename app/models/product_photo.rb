class ProductPhoto < ApplicationRecord
  belongs_to :product, optional: true

  mount_uploaders :photo, ImgNameUploader
end
