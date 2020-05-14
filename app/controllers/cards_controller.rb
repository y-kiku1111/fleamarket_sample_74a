class CardsController < ApplicationController
  require "payjp"

  before_action :get_payjp_info, only: [:create, :delete, :show, :new, :pay]
  before_action :set_item

  def set_item
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def buy
  end

  def pay #payjpとCardのデータベース作成


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
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end
end

