class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /survey/:survey_id/questions
  # GET /survey/:survey_id/questions.xml
  def index
    @survey = current_user.surveys.find(params[:survey_id])
    @questions = @survey.questions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /survey/:survey_id/questions/1
  # GET /survey/:survey_id/questions/1.xml
  def show
    public_view = !current_user || !!params[:public]
    @survey = (public_view ? Survey : current_user.surveys).find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @response = @question.responses.build  if public_view
    
    respond_to do |format|
      format.html { render :template => "public_views/question.html.erb", :layout => "public"   if public_view }
      format.xml  { render :xml => @question }
    end
  end

  # GET /survey/:survey_id/questions/new
  # GET /survey/:survey_id/questions/new.xml
  def new
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /survey/:survey_id/questions/1/edit
  def edit
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
  end

  # POST /survey/:survey_id/questions
  # POST /survey/:survey_id/questions.xml
  def create
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.build(params[:question])
    @question.process_answer_choices(params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to(survey_question_path(@survey, @question), :notice => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey/:survey_id/questions/1
  # PUT /survey/:survey_id/questions/1.xml
  def update
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @question.process_answer_choices(params)
    
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(survey_question_path(@survey, @question), :notice => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /survey/:survey_id/questions/1
  # DELETE /survey/:survey_id/questions/1.xml
  def destroy
    @survey = current_user.surveys.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(survey_questions_url(@survey)) }
      format.xml  { head :ok }
    end
  end
end
