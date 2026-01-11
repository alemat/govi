class OrganizationUnitsController < ApplicationController
  before_action :set_organization_unit, only: %i[ show edit update destroy ]

  # GET /organization_units or /organization_units.json
  def index
    @organization_units = OrganizationUnit.all
  end

  # GET /organization_units/1 or /organization_units/1.json
  def show
  end

  # GET /organization_units/new
  def new
    @organization_unit = OrganizationUnit.new
  end

  # GET /organization_units/1/edit
  def edit
  end

  # POST /organization_units or /organization_units.json
  def create
    @organization_unit = OrganizationUnit.new(organization_unit_params)

    respond_to do |format|
      if @organization_unit.save
        format.html { redirect_to @organization_unit, notice: "Organization unit was successfully created." }
        format.json { render :show, status: :created, location: @organization_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_units/1 or /organization_units/1.json
  def update
    respond_to do |format|
      if @organization_unit.update(organization_unit_params)
        format.html { redirect_to @organization_unit, notice: "Organization unit was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @organization_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_units/1 or /organization_units/1.json
  def destroy
    @organization_unit.destroy!

    respond_to do |format|
      format.html { redirect_to organization_units_path, notice: "Organization unit was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_unit
      @organization_unit = OrganizationUnit.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_unit_params
      params.expect(organization_unit: [ :name, :custom_name, :short_name, :code, :ownership, :url, :latitude, :longitude, :phone, :email, :description, :visitable, :organization_type_id, :parent_organization_unit_id ])
    end
end
