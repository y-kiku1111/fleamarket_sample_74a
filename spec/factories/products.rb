FactoryBot.define do
  factory :product do
    name              {"iPhoneケース"}
    explanation       {"人気商品です"}
    price             {20000}
    status            {1}
    bear              {1}
    days              {1}
    brand             {"PRADA"}
    category_id       {1}
    # user
    # category
    # address
    # after(:build) do |product|
    #   product.product_photos << build(:photo)
    # end
  end
    
end
