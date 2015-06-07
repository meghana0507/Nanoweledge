class RateUserTutorialsController < ApplicationController
  before_action :set_rate_user_tutorial, only: [:show, :edit, :update, :destroy]

  # GET /rate_user_tutorials
  # GET /rate_user_tutorials.json
  def index
    @rate_user_tutorials = RateUserTutorial.all
  end

  # GET /rate_user_tutorials/1
  # GET /rate_user_tutorials/1.json
  def show
  end

  # GET /rate_user_tutorials/new
  def new
    if !logged_in?
      redirect_to login_path
    end
    
    if params[:tutorial_id]==nil || !(@tutorial=Tutorial.find(params[:tutorial_id]))
      redirect_to root_path, notice: 'No tutorial found.'
    end
    if @tutorial.rate_users.include?(current_user)
      redirect_to @tutorial, notice: 'You have already rated this tutorial.'
    end
    @rate_user_tutorial = RateUserTutorial.new
    @rate_user_tutorial.tutorial_id=params[:tutorial_id]
  end

  # GET /rate_user_tutorials/1/edit
  def edit
  end

  # POST /rate_user_tutorials
  # POST /rate_user_tutorials.json
  def create
    if !logged_in?
      redirect_to login_path
    end
    @rate_user_tutorial = RateUserTutorial.new(rate_user_tutorial_params)
    @rate_user_tutorial.user_id=current_user.id
    respond_to do |format|
      if @rate_user_tutorial.save
        format.html { redirect_to @rate_user_tutorial.tutorial, notice: 'Rate user tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @rate_user_tutorial }
      else
        format.html { render :new }
        format.json { render json: @rate_user_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rate_user_tutorials/1
  # PATCH/PUT /rate_user_tutorials/1.json
  def update
    respond_to do |format|
      if @rate_user_tutorial.update(rate_user_tutorial_params)
        format.html { redirect_to @rate_user_tutorial, notice: 'Rate user tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @rate_user_tutorial }
      else
        format.html { render :edit }
        format.json { render json: @rate_user_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_user_tutorials/1
  # DELETE /rate_user_tutorials/1.json
  def destroy
    @rate_user_tutorial.destroy
    respond_to do |format|
      format.html { redirect_to rate_user_tutorials_url, notice: 'Rate user tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate_user_tutorial
      @rate_user_tutorial = RateUserTutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_user_tutorial_params
      params.require(:rate_user_tutorial).permit(:tutorial_id, :user_id, :score)
    end
end
