class ResponsesController < ApplicationController


  # GET /response/:q_id
  def new
    @question = Question.find params[:q_id]
    @survey = @question.survey
    @answer_choices = @question.answer_choices
    @response = Response.new(:question => @question)
  end

  # POST /surveys/:survey_id/answers
  def create
    @response = Response.new(params[:response])
    @question = @response.question
    @response.save
    render :text => "done"
    #redirect_to @question.last? ? survey_path(@survey) : survey_question_path(@survey, @question.next)
  end

end
