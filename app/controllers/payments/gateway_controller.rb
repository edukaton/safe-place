module Payments
  class GatewayController < ApplicationController
    skip_before_filter :verify_authenticity_token
    layout "payments"

    def payment
      Event.create(
        participation: current_participation,
        event_type: "payments/form-opened",
        description: "Otwarcie strony płatności"
      )
      @amount = params[:amount].to_i
      @order_id = params[:order_id]
      @success_url = params[:success_url]
      @failure_url = params[:failure_url]
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
        order = Order.find_by(
          id: params[:payment][:order_id]
        )

        if avatar.nil?
          Event.create(
            participation: current_participation,
            event_type: "payments/payment-failed",
            description: "Niepoprawna płatność - błędne dane karty"
          )

          @failure_url = @schema[:failure_url]
          render :failure
          return
        end

        order.update_attributes(paid: true)
        Event.create(
          participation: current_participation,
          event_type: "payments/payment-processed",
          description: "Poprawka płatność"
        )

        redirect_to @schema[:success_url]
      else
        Event.create(
          participation: current_participation,
          event_type: "payments/payment-failed",
          description: "Niepoprawna płatność - błędnie wypełniony formularz"
        )

        @failure_url = @schema[:failure_url]
        render :failure
        return
      end
    end
  end
end