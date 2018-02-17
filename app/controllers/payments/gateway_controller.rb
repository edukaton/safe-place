module Payments
  class GatewayController < ApplicationController
    def payment
    end

    def process_payment
      redirect_to :success
    end

    def success
    end
  end
end