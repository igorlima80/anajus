class SexesController < Admin::ApplicationController
  load_and_authorize_resource

  # GET /sexes
  def index
    @sexes = Sex.all
  end

  # GET /sexes/1
  def show
  end

  # GET /sexes/new
  def new
    @sex = Sex.new
  end

  # GET /sexes/1/edit
  def edit
  end

  # POST /sexes
  def create
    @sex = Sex.new(sex_params)

    if @sex.save
      redirect_to @sex, notice: 'Sex was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sexes/1
  def update
    if @sex.update(sex_params)
      redirect_to @sex, notice: 'Sex was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sexes/1
  def destroy
    @sex.destroy
    redirect_to sexes_url, notice: 'Sex was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sex
      @sex = Sex.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sex_params
      params.require(:sex).permit(:name)
    end
end
