class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show]
  before_action :set_tutorial_and_authenticate_user, only: [:edit, :update, :destroy]
  # GET /tutorials
  # GET /tutorials.json
  def index
    if params[:search]
      @tutorials=Tutorial.find_by_sql("SELECT T.*
      FROM tutorials T
      WHERE T.title LIKE '%" + params[:search] + "%'
      union
      SELECT T.*
      FROM tutorials T, steps S
      WHERE S.tutorial_id=T.id and 
      S.description LIKE '%" + params[:search] + "%'
      union
      SELECT T.*
      FROM tutorials T, keywords K,keyword_tutorials KT
      WHERE KT.tutorial_id=T.id and 
      KT.keyword_id=K.id and
      K.name LIKE '%" + params[:search] + "%'")
    else
      @tutorials = Tutorial.all
    end
  end
  
  def myindex
    if logged_in?
      @tutorials = current_user.tutorials
    else
      redirect_to tutorials_path
    end
  end
  
  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    @avg_score=@tutorial.rate_user_tutorials.collect(&:score).sum.to_f/@tutorial.rate_user_tutorials.length if @tutorial.rate_user_tutorials.length > 0
    @relavent_tutorials=Tutorial.find_by_sql("SELECT distinct T.* 
    FROM tutorials T, keywords K, keyword_tutorials KT
    WHERE T.id!=" + @tutorial.id.to_s + " and
    T.id=KT.tutorial_id and 
    KT.keyword_id=K.id and
    K.name in
    (SELECT K.name
    FROM keywords K, keyword_tutorials KT
    WHERE K.id=KT.keyword_id and KT.tutorial_id=" + @tutorial.id.to_s + ") limit 10")
    if logged_in?
      if !@tutorial.read_users.include?(current_user)
        @tutorial.read_users<<current_user
      end
    end
  end

  # GET /tutorials/new
  def new
    if logged_in?
      @tutorial = Tutorial.new
    else
      redirect_to login_path
    end
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    if !logged_in?
      redirect_to loggin_path
    end
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user=current_user
    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.steps.each do |step|
      step.destroy
    end
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end
    def set_tutorial_and_authenticate_user
      @tutorial = Tutorial.find(params[:id])
      if @tutorial.user!=current_user && current_user.user_name!="admin"
        redirect_to root_path, notice: 'You are not allowed to do this operation.'
      end
      
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :tutorial_level, :user_id, :topic_id, steps_attributes: [:id, :s_no, :description, :_destroy], keywords_attributes: [:id, :name, :_destroy])
    end
end
