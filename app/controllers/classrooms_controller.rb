class ClassroomsController < ApplicationController
  def create
    @schema = NewClassroomSchema.call(params[:classroom])

    if @schema.success?
      @classroom = Classroom.new(
        name: @schema[:name],
        code: SecureRandom.alphanumeric[0..5].upcase
      )
      @classroom.save

      redirect_to classroom_path(@classroom.code)
    else
      @classroom = Classroom.new(name: @schema[:name])
      flash.now[:error] = "Niepoprawne dane"
      render :new
    end
  end

  def new
  	@classroom = Classroom.new
  end

  def show
    @classroom = Classroom.find_by(code: params[:id])
    @participations = Participation.where(classroom_id: @classroom.id)
  end
end
