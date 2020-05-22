class CardsController < ApplicationController
  require "payjp"

  before_action :get_payjp_info
  before_action :set_product, only: [:create, :show, :pay, :new]
  before_action :set_cards, only: [:delete, :index, :show, :new]
  before_action :set_create, only: [:create, :create1]
  before_action :set_parents, only: :new1

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
          @cardinfo = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
        elsif @cnt == 2
          @default_card_information2 = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
          @cardinfo = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
        elsif @cnt == 3
          @default_card_information3 = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
          @cardinfo　= Payjp::Customer.retrieve(card.customer_id).cards.data[0]
        end
      end
    end
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def show
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

  def set_create
    customer = Payjp::Customer.create(
    card: params['payjp_token'],
    metadata: {user_id: current_user.id})
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  end

  def create 
    if @card.save
      flash[:notice] = 'クレジットカードの登録が完了しました。購入画面に戻ります。'
      redirect_to action: "show"
    else
      flash[:alert] = 'クレジットカード登録に失敗しました'
      redirect_to action: "new"
    end
  end

  def create1    
    if @card.save
      flash[:notice] = 'クレジットカードの登録が完了しました。登録カード一覧に戻ります。'
      redirect_to action: "index"
    else
      flash[:alert] = 'クレジットカード登録に失敗しました'
      redirect_to action: "new1"
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

  def new1
  end

  private

  def get_payjp_info
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
  end

  def set_parents
    @parents = Category.where(ancestry: nil) 
  end
end