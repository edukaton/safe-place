module Payments
  class GatewayController < ApplicationController
    layout "payments"

    def payment
      Event.create(
        participation: current_participation,
        event_type: "payments/form-opened",
        description: "Otwarcie strony płatności"
      )
      @amount = params[:amount]
      @redirect_link = params[:redirect_link]
    end

    def process_payment
      @schema = ProcessPaymentSchema.call(params[:payment])

      if @schema.success?
        first_name, last_name = @schema[:full_name].split(/\s+/)
        avatar = Avatar.
          find_by(
            first_name: first_name,
            last_name: last_name,
            card_number: @schema[:card_number]
          )

        if avatar.nil?
          Event.create(
            participation: current_participation,
            event_type: "payments/payment-failed",
            description: "Niepoprawna płatność - błędne dane karty"
          )

          redirect_to :failure
        end

        Event.create(
          participation: current_participation,
          event_type: "payments/payment-processed",
          description: "Poprawka płatność"
        )

        redirect_to @schema[:redirect_link]
      else
        Event.create(
          participation: current_participation,
          event_type: "payments/payment-failed",
          description: "Niepoprawna płatność - błędnie wypełniony formularz"
        )

        redirect_to :failure
      end
    end
  end
end