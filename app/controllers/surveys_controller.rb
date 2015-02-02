class SurveysController < ApplicationController
  def index
    @survey = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to root_path
    else
      render 'new'
      puts @survey.errors.messages
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def show
    @survey = Survey.find(params[:id])
    #:@question = @survey.questions.build
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:name,:survey_type, :conducted_on, :count_people)
  end
end
