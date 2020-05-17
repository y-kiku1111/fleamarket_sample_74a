require 'rails_helper'

describe product do
  describe '#create' do
    context '出品出来る場合' do
      it 'productとproduct_photoがある場合商品を出品できる' do
        expect(build(:product, :product_photo [build(:product_photo)])).to be_valid
      end
    end
  end
end