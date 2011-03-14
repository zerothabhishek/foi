class AnswerChoicesController < ApplicationController
  # GET /answer_choices
  # GET /answer_choices.xml
  def index
    @answer_choices = AnswerChoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @answer_choices }
    end
  end

  # GET /answer_choices/1
  # GET /answer_choices/1.xml
  def show
    @answer_choice = AnswerChoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer_choice }
    end
  end

  # GET /answer_choices/new
  # GET /answer_choices/new.xml
  def new
    @answer_choice = AnswerChoice.new
    @ans_type_requested = params[:ans_type]
    @addon = params[:addon]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer_choice }
      format.js { 
        render :layout => false 
      }
    end
  end

  # GET /answer_choices/1/edit
  def edit
    @answer_choice = AnswerChoice.find(params[:id])
  end

  # POST /answer_choices
  # POST /answer_choices.xml
  def create
    @answer_choice = AnswerChoice.new(params[:answer_choice])

    respond_to do |format|
      if @answer_choice.save
        format.html { redirect_to(@answer_choice, :notice => 'Answer choice was successfully created.') }
        format.xml  { render :xml => @answer_choice, :status => :created, :location => @answer_choice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer_choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answer_choices/1
  # PUT /answer_choices/1.xml
  def update
    @answer_choice = AnswerChoice.find(params[:id])

    respond_to do |format|
      if @answer_choice.update_attributes(params[:answer_choice])
        format.html { redirect_to(@answer_choice, :notice => 'Answer choice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer_choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_choices/1
  # DELETE /answer_choices/1.xml
  def destroy
    @answer_choice = AnswerChoice.find(params[:id])
    @answer_choice.destroy

    respond_to do |format|
      format.html { redirect_to(answer_choices_url) }
      format.xml  { head :ok }
    end
  end
end
