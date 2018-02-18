class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @task = @participation.task
  end

  def verify
    participation = Participation.find(params[:id])

    if participation.completed?
      flash[:error] = "Zadanie zostało już wcześniej ukończone"
      redirect_to root_path
      return
    end

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

    redirect_to participation_path(participation)
  end
end
