class QuestionsController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new
    4.times do
      @options = @question.options.new
    end
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(question_params)
    if @question.save
      redirect_to survey_questions_path
    else
      puts @question.errors.messages
      render 'new'
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @options = @question.options
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @options = @question.options
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to survey_question_path
    else
      puts @question.errors.messages
      render 'edit'
    end
  end
  private
  def question_params
    params.require(:question).permit(:description, :survey_id, :options_attributes => [:id, :description])
  end
end
