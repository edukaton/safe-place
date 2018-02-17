module Payments
  class GatewayController < ApplicationController
    layout "payments"

    def payment
    end

    def process_payment
      redirect_to :success
    end

    def success
    end
  end
end