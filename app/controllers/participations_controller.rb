class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @task = @participation.task
  end

  def verify
    participation = Participation.find(params[:id])
    order = Order.find_by(
      reference: params[:reference],
      paid: true
    )

    if order.present?
      flash[:notice] = "Zadanie zakończone"
      participation.update(completed: true)
    else
      flash[:error] = "Niepoprawny numer rezerwacji"
    end

    redirect_to root_path
  end
end