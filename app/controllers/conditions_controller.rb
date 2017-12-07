class ConditionsController < ApplicationController
  before_action :set_condition, only: [:edit, :update, :destroy]
  before_action :check_logging_in, only: [ :index, :show, :edit, :destroy ]

  # GET /conditions
  # GET /conditions.json
  def index
    @conditions = Condition.all
  end

  # GET /conditions/1
  # GET /conditions/1.json
  def show
    @student = Student.find(params[:id])
    @conditions = @student.conditions.order(created_at: :desc)
    @past_table = "Past Record"
    @new_table = "New Record"
  end

  # GET /conditions/new
  def new
    @condition = Condition.new
  end

  # POST /conditions
  # POST /conditions.json
  def create
    @condition = Condition.new(condition_params)
      if @condition.save
        redirect_to student_path(params[:condition][:student_id]), notice: 'new Condition was successfully created.'
      else
        @student = Student.find(params[:condition][:student_id])
        @conditions = @student.conditions.order(date: :desc)
        progress = (@student.conditions).maximum(:progress)
        @achievement = (progress * 100 / number_of_pages).round
        @past_table = "Past Record"
        @new_table = "New Record"
        render 'students/show'
      end
  end

  # GET /conditions/1/edit
  def edit
    @name = (Student.find(@condition.student_id)).name
  end

  # PATCH/PUT /conditions/1
  # PATCH/PUT /conditions/1.json
  def update
      if @condition.update(condition_params)
        redirect_to student_path(params[:condition][:student_id]), notice: 'Condition was successfully updated.'
      else
        render 'edit'
      end
  end


  # DELETE /conditions/1
  # DELETE /conditions/1.json
  def destroy
    student_id = @condition.student_id
    @condition.destroy
      redirect_to student_path(student_id), notice: 'Condition was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_params
      params.require(:condition).permit(:progress, :date, :comment, :username, :student_id)
    end

end
