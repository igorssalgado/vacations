class VacationsController < ApplicationController
  before_action :set_vacation, only: %i[ show edit update destroy ]

  # GET /vacations or /vacations.json
  def index
    @vacations = Vacation.all
  end

  # GET /vacations/1 or /vacations/1.json
  def show
  end

  # GET /vacations/new
  def new
    @vacation = Vacation.new
  end

  # GET /vacations/1/edit
  def edit
    validate(@vacation)
  end

  # POST /vacations or /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)
    
    validate(@vacation)

    respond_to do |format|
      if @vacation.save
        format.html { redirect_to vacation_url(@vacation), notice: "Vacation was successfully created." }
        format.json { render :show, status: :created, location: @vacation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  def validate(vacation)
    # puts vacation.first_name
    # puts vacation.last_name
    # puts vacation.email
    # puts vacation.vacation_days
    # puts vacation.starting_date
    # puts vacation.ending_date
    # puts vacation.bonus

    #calcula o end_date dia baseado no start_date e vacation_days
    vacation_days = vacation.vacation_days-1
    end_date = (vacation.starting_date+vacation_days).to_s
    vacation.ending_date = end_date
  end

  # PATCH/PUT /vacations/1 or /vacations/1.json
  def update

    respond_to do |format|
      if @vacation.update(vacation_params)
        format.html { redirect_to vacation_url(@vacation), notice: "Vacation was successfully updated." }
        format.json { render :show, status: :ok, location: @vacation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1 or /vacations/1.json
  def destroy
    @vacation.destroy!

    respond_to do |format|
      format.html { redirect_to vacations_url, notice: "Vacation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_params
      params.require(:vacation).permit(:first_name, :last_name, :email, :vacation_days, :starting_date, :ending_date, :bonus)
    end
end
