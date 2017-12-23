class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :check_logging_in, only: [ :index, :show, :edit, :destroy ]

  # GET /students
  # GET /students.json
  def index
    #progressが大きい順に全てのconditionsを取得
    all_conditions = Condition.where.not(progress: nil).order(progress: :desc)
    #ビューでstudent_idを元にそのstudentのprogressが一番高いレコードを取ってくるために、まずはコントローラーから全てのstudent_idを取ってきて、配列に入れていく。progressが一番高いレコードから入れていくので、必然的にprogressが高い順にstudent_idが入るはずである。
    @student_ids_ordered_by_progress = Array.new
    all_conditions.each do |condition|
      if @student_ids_ordered_by_progress.index(condition.student_id) == nil
      @student_ids_ordered_by_progress << condition.student_id
      end
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @condition = Condition.new
    @conditions = @student.conditions.order(date: :desc)
    progress = (@student.conditions).maximum(:progress)
    @achievement = (progress * 100 / number_of_pages).round
    @past_table = "Past Record"
    @new_table = "New Record"
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    if @student.save
      #アソシエーションを使って"new"にするとそれに紐づいたnewインスタンスも作れる
      condition = @student.conditions.new
      #下記と同義
      # condition = Condition.new
      # condition.student_id = @student.id
      condition.save
      redirect_to student_path(@student.id), notice: 'Student was successfully created'
    else
      render 'new'
    end
  end


  # PATCH/PUT /students/1
  def update
      if @student.update(student_params)
        redirect_to @student, notice: 'Student was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
      redirect_to students_url, notice: 'Student was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name)
    end

end
