class CardsController < ApplicationController
  require "payjp"

  before_action :get_payjp_info, only: [:create, :delete, :show, :new, :pay, :index]
  before_action :set_item, only: [:create, :delete, :show, :new, :pay]

  def set_item
    @product = Product.find(params[:product_id])
    @card = Card.find_by(user_id: current_user.id)
    @cards = Card.where(user_id: current_user.id)

    unless @card == nil
      @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]

      @cnt = 0
      @cards.each do |card|
        @cnt = @cnt + 1
        # @inoue + (cnt.to_s) = "test"
        # @"default_card_informations"&cnt = Payjp::Customer.retrieve(card.customer_id).cards
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

  # def set_item_delete
  #   @product = Product.find(params[:product_id])
  #   @cards = Card.where(user_id: current_user.ied)
  #   cnt = 0
  #   @cards.each do |card|
  #     cnt = cnt + 1
  #     @default_card_information = Payjp::Customer.retrieve(card.customer_id).cards
  #     # binding.pry
  #   end
  # end

  def index

    @card = Card.find_by(user_id: current_user.id)
    @cards = Card.where(user_id: current_user.id)

    unless @card == nil
      @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]

      @cnt = 0
      @cards.each do |card|
        @cnt = @cnt + 1
        # @inoue + (cnt.to_s) = "test"
        # @"default_card_informations"&cnt = Payjp::Customer.retrieve(card.customer_id).cards
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

  def pay
    @parents = Category.where(ancestry: nil)  
    @card = Card.find_by(user_id: current_user.id)
    @product.buyer_user_id = current_user.id
    @product.save!
    # Payjp::Charge.createという記述によって支払いが行われる
    @charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    currency: 'jpy'
      )
  end

  def create #payjpとCardのデータベース作成
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

  def delete
    binding.pry
    card = current_user.cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "confirmation", id: current_user.id
  end

  private

  def get_payjp_info
    if Rails.env == 'development'
      # binding.pry
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    # else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end
end
