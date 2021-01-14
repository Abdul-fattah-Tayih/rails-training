class ProfessionalDataController < ApplicationController
  before_action :set_professional_datum, only: [:show, :edit, :update, :destroy]

  # GET /professional_data
  # GET /professional_data.json
  def index
    @professional_data = ProfessionalDatum.all
  end

  # GET /professional_data/1
  # GET /professional_data/1.json
  def show
  end

  # GET /professional_data/new
  def new
    @professional_datum = ProfessionalDatum.new
  end

  # GET /professional_data/1/edit
  def edit
  end

  # POST /professional_data
  # POST /professional_data.json
  def create
    @professional_datum = ProfessionalDatum.new(professional_datum_params)

    respond_to do |format|
      if @professional_datum.save
        format.html { redirect_to @professional_datum, notice: 'Professional datum was successfully created.' }
        format.json { render :show, status: :created, location: @professional_datum }
      else
        format.html { render :new }
        format.json { render json: @professional_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_data/1
  # PATCH/PUT /professional_data/1.json
  def update
    respond_to do |format|
      if @professional_datum.update(professional_datum_params)
        format.html { redirect_to @professional_datum, notice: 'Professional datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional_datum }
      else
        format.html { render :edit }
        format.json { render json: @professional_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_data/1
  # DELETE /professional_data/1.json
  def destroy
    @professional_datum.destroy
    respond_to do |format|
      format.html { redirect_to professional_data_url, notice: 'Professional datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_datum
      @professional_datum = ProfessionalDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professional_datum_params
      params.require(:professional_datum).permit(:job_title_en, :job_title_ar, :period_from, :period_to, :user_id)
    end
end
