class SurveysController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /surveys
  # GET /surveys.xml
  def index
    @surveys = current_user.surveys.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  def show  
    public_view = !current_user || params[:public]
    @survey = (public_view ? Survey : current_user.surveys).find(params[:id])

    respond_to do |format|
      format.html { render :template => "public_views/survey.html.erb", :layout => "public"   if public_view }
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey = current_user.surveys.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = current_user.surveys.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = current_user.surveys.build(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to(@survey, :notice => 'Survey was successfully created.') }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = current_user.surveys.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to(@survey, :notice => 'Survey was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = current_user.surveys.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end
end
