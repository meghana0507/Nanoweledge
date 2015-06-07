class ReadUserTutorialsController < ApplicationController
  before_action :set_read_user_tutorial, only: [:show, :edit, :update, :destroy]

  # GET /read_user_tutorials
  # GET /read_user_tutorials.json
  def index
    @read_user_tutorials = ReadUserTutorial.all
  end

  # GET /read_user_tutorials/1
  # GET /read_user_tutorials/1.json
  def show
  end

  # GET /read_user_tutorials/new
  def new
    @read_user_tutorial = ReadUserTutorial.new
  end

  # GET /read_user_tutorials/1/edit
  def edit
  end

  # POST /read_user_tutorials
  # POST /read_user_tutorials.json
  def create
    @read_user_tutorial = ReadUserTutorial.new(read_user_tutorial_params)

    respond_to do |format|
      if @read_user_tutorial.save
        format.html { redirect_to @read_user_tutorial, notice: 'Read user tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @read_user_tutorial }
      else
        format.html { render :new }
        format.json { render json: @read_user_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /read_user_tutorials/1
  # PATCH/PUT /read_user_tutorials/1.json
  def update
    respond_to do |format|
      if @read_user_tutorial.update(read_user_tutorial_params)
        format.html { redirect_to @read_user_tutorial, notice: 'Read user tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @read_user_tutorial }
      else
        format.html { render :edit }
        format.json { render json: @read_user_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /read_user_tutorials/1
  # DELETE /read_user_tutorials/1.json
  def destroy
    @read_user_tutorial.destroy
    respond_to do |format|
      format.html { redirect_to read_user_tutorials_url, notice: 'Read user tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_read_user_tutorial
      @read_user_tutorial = ReadUserTutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def read_user_tutorial_params
      params.require(:read_user_tutorial).permit(:tutorial_id, :user_id)
    end
end
