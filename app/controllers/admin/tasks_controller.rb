module Admin
  class TasksController < ApplicationController
    def new
      @task = Task.new
    end

    def create
      @task = Task.new(params[:task].permit(:title, :description))
      @task.save
      redirect_to admin_tasks_path
    end

    def index
      @tasks = Task.all
    end

    def edit
      @task = Task.find(params[:id])
    end

    def update
      @task = Task.find(params[:id])
      @task.update_attributes(params[:task].permit(:title, :description))
      redirect_to admin_tasks_path
    end
  end
end