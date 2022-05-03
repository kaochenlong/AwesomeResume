# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
  end

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
      @order.pay!
      redirect_to orders_path, notice: "已付款成功"
    else
      @order.fail!
      redirect_to orders_path, alert: "付款失敗: #{result.errors}"
    end
  end

  def cancel
    @order = Order.friendly.find(params[:id])
    @order.cancel!
    redirect_to orders_path, notice: "訂單已取消"
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
