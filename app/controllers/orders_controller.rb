# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user

  def checkout
    @token = gateway.client_token.generate
    @order = Order.friendly.find(params[:id])
  end

  def pay
    @order = Order.friendly.find(params[:id])
    result = gateway.transaction.sale(
      amount: @order.price,
      payment_method_nonce: params[:nonce],
    )
    if result.success?
      redirect_to root_path, notice: "ok"
    else
      redirect_to root_path, alert: "fail"
    end
  end

  private

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV.fetch('MERCHANT_ID', nil),
      public_key: ENV.fetch('PUBLIC_KEY', nil),
      private_key: ENV.fetch('PRIVATE_KEY', nil)
    )
  end
end
