require 'rails_helper'

describe Card do

  let(:user){create(:user)}
  let(:card){create(:card)}

  describe '#create' do

    it 'customer_idがない時は保存されないこと' do
      card = Card.new(customer_id: "", card_id: "111", user_id: "111")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it 'card_idがない時は保存されないこと' do
      card = Card.new(customer_id: "111", card_id: "", user_id: "111")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
    
    it 'user_idがない時は保存されないこと' do
      card = Card.new(customer_id: "111", card_id: "111", user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end

    it "customer_idとcard_idとuser_idが存在すれば登録できること" do
      card = build(:card, user_id: user.id )
      expect(card).to be_valid
    end

  end
end