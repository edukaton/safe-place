module Payments
  class GatewayController < ApplicationController
    layout "payments"

    def payment
    end

    def process_payment
      @schema = ProcessPaymentSchema.call(params)

      if @schema.success?
        first_name, last_name = @schema[:full_name].split(/\s+/)
        avatar = Avatar.
          find_by(
            first_name: first_name,
            last_name: last_name,
            card_number: @schema[:card_number]
          )

        if avatar.nil?
          redirect_to :failure
        end

        redirect_to :success
      else
        redirect_to :failure
      end
    end

    def success
    end

    def failure
    end
  end
end