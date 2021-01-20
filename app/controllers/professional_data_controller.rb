class ProfessionalDataController < ApplicationController
  before_action :set_employee
  before_action :set_professional_datum, only: [:show, :edit, :update, :destroy]

  # GET /professional_data
  # GET /professional_data.json
  def index
    @professional_datum = @employee.professional_data
  end

  # GET /professional_data/1
  # GET /professional_data/1.json
  def show
    @professional_datum = ProfessionalData.find(params[:professional_data])
  end

  # GET /professional_data/new
  def new
    @professional_datum = ProfessionalData.new
  end

  # GET /professional_data/1/edit
  def edit
  end

  # POST /professional_data
  # POST /professional_data.json
  def create
    @professional_datum = ProfessionalData.new(professional_datum_params)

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
    @professional_datum = ProfessionalData.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  # Only allow a list of trusted parameters through.
  def professional_datum_params
    params.fetch(:professional_data).permit(:started_at, :ended_at, :employee_id, title: {})
  end
end
