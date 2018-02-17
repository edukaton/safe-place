class AvatarsController < ApplicationController
  def create
    @schema = NewAvatarSchema.call(params)

    if @schema.success?
      @classroom = Classroom.find_by(code: @schema[:classroom_code])

      if @classroom.nil?
        flash[:error] = "Niepoprawny kod klasy"
        redirect_to new_avatar_path
        return
      end

      random = RandomData.instance.generate(@schema[:gender].to_sym)

    	@avatar = Avatar.new(
        first_name: random[:first_name],
        last_name: random[:last_name],
        address: random[:address],
        city: random[:city],
        postal_code: random[:postal_code],
        pesel: random[:pesel],
        card_number: random[:card_number],
        card_cvv: random[:card_cvv],
        card_expire_month: random[:card_expire_month],
        card_expire_year: random[:card_expire_year],
        code: SecureRandom.alphanumeric[0..5].upcase,
        classroom_id: @classroom.id
      )

      @avatar.save
      tasks = Task.all
      tasks.each do |task|
        Participation.create(
          avatar_id: @avatar.id,
          classroom_id: @classroom.id,
          task_id: task.id
        )
      end

      cookies[:avatar_id] = @avatar.id

      redirect_to root_path
    else
      flash.now[:error] = "Niepoprawne dane"
      render :new
    end
  end

  def show
    @avatar = Avatar.find_by(code: params[:id])
  end
end