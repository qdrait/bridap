class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_questions, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.accessible_by(current_ability).order("created_at desc")
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Form::Answer.new
    @questions = Question.where(office_id: current_user.office.id)
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Form::Answer.new(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to thanks_path, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answers_path, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def top
  end

  def thanks
  end

  def authentication
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Form::Answer.find(params[:id])
  end

  def set_questions
    @questions = Question.where(office_id: @answer.office_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params
      .require(:form_answer)
      .permit(
        Form::Answer::REGISTRABLE_ATTRIBUTES +
        [answer_details_attributes: Form::AnswerDetail::REGISTRABLE_ATTRIBUTES]
      )
  end

end
