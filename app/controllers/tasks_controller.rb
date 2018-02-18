class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def verify
    @task = Task.find(params[:id])
    order = Order.find_by(reference: params[:reference])

    if order.present?
      participation = Participation.find_by(
        avatar_id: current_avatar.id,
        task: @task.id
      )
    end
  end
end