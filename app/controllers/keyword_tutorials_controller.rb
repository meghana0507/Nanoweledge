class KeywordTutorialsController < ApplicationController
  before_action :set_keyword_tutorial, only: [:show, :edit, :update, :destroy]

  # GET /keyword_tutorials
  # GET /keyword_tutorials.json
  def index
    @keyword_tutorials = KeywordTutorial.all
  end

  # GET /keyword_tutorials/1
  # GET /keyword_tutorials/1.json
  def show
  end

  # GET /keyword_tutorials/new
  def new
    @keyword_tutorial = KeywordTutorial.new
  end

  # GET /keyword_tutorials/1/edit
  def edit
  end

  # POST /keyword_tutorials
  # POST /keyword_tutorials.json
  def create
    @keyword_tutorial = KeywordTutorial.new(keyword_tutorial_params)

    respond_to do |format|
      if @keyword_tutorial.save
        format.html { redirect_to @keyword_tutorial, notice: 'Keyword tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @keyword_tutorial }
      else
        format.html { render :new }
        format.json { render json: @keyword_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keyword_tutorials/1
  # PATCH/PUT /keyword_tutorials/1.json
  def update
    respond_to do |format|
      if @keyword_tutorial.update(keyword_tutorial_params)
        format.html { redirect_to @keyword_tutorial, notice: 'Keyword tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @keyword_tutorial }
      else
        format.html { render :edit }
        format.json { render json: @keyword_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keyword_tutorials/1
  # DELETE /keyword_tutorials/1.json
  def destroy
    @keyword_tutorial.destroy
    respond_to do |format|
      format.html { redirect_to keyword_tutorials_url, notice: 'Keyword tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword_tutorial
      @keyword_tutorial = KeywordTutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_tutorial_params
      params.require(:keyword_tutorial).permit(:tutorial_id, :keyword_id)
    end
end
