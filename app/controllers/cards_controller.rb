class CardsController < ApplicationController
  require "payjp"

  before_action :get_payjp_info
  before_action :set_product, only: [:create, :show, :pay, :new]
  before_action :set_cards, only: [:delete, :index, :show, :new]
  before_action :set_user, only: [:show]

  def set_cards
    @card = Card.find_by(user_id: current_user.id)
    @cards = Card.where(user_id: current_user.id)
    
    @cnt = 0
    unless @card == nil
      @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]
      @cards.each do |card|
        @cnt = @cnt + 1
        if @cnt == 1 
          @default_card_information1 = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
        elsif @cnt == 2
          @default_card_information2 = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
        elsif @cnt == 3
          @default_card_information3 = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
        end
      end
    end
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def pay
    @parents = Category.where(ancestry: nil)  
    @card = Card.find_by(user_id: current_user.id)
    @product.buyer_user_id = current_user.id
    @product.save!
    @charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    currency: 'jpy'
      )
  end

  def create 
    customer = Payjp::Customer.create(
      card: params['payjp_token'],
      metadata: {user_id: current_user.id}
      ) 
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    
    if @card.save
      redirect_to action: "show"
      flash[:notice] = 'クレジットカードの登録が完了しました'
    else
      redirect_to action: "new"
      flash[:alert] = 'クレジットカード登録に失敗しました'
    end
  end

  def delete1
    cards = Card.where(user_id: current_user.id)
    card =cards[0]    
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to  user_cards_path(current_user.id)
  end

  def delete2
    cards = Card.where(user_id: current_user.id)
    card =cards[1]    
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to  user_cards_path(current_user.id)
  end

  def delete3
    cards = Card.where(user_id: current_user.id)
    card =cards[2]    
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to  user_cards_path(current_user.id)
  end

  private

  def get_payjp_info
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
  end
end