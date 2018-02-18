module Admin
  class UtilsController < ApplicationController
    def clean
      Avatar.delete_all
      Classroom.delete_all
      Participation.delete_all
      Order.delete_all

      redirect_to root_path
    end
  end
end