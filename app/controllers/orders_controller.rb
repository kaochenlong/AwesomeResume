# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user

  def checkout
    @token = gateway.client_token.generate
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
