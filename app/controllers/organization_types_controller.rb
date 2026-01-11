class OrganizationTypesController < ApplicationController
  before_action :set_organization_type, only: %i[ show edit update destroy ]

  # GET /organization_types or /organization_types.json
  def index
    @organization_types = OrganizationType.all
  end

  # GET /organization_types/1 or /organization_types/1.json
  def show
  end

  # GET /organization_types/new
  def new
    @organization_type = OrganizationType.new
  end

  # GET /organization_types/1/edit
  def edit
  end

  # POST /organization_types or /organization_types.json
  def create
    @organization_type = OrganizationType.new(organization_type_params)

    respond_to do |format|
      if @organization_type.save
        format.html { redirect_to @organization_type, notice: "Organization type was successfully created." }
        format.json { render :show, status: :created, location: @organization_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_types/1 or /organization_types/1.json
  def update
    respond_to do |format|
      if @organization_type.update(organization_type_params)
        format.html { redirect_to @organization_type, notice: "Organization type was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @organization_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_types/1 or /organization_types/1.json
  def destroy
    @organization_type.destroy!

    respond_to do |format|
      format.html { redirect_to organization_types_path, notice: "Organization type was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_type
      @organization_type = OrganizationType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_type_params
      params.expect(organization_type: [ :name, :description ])
    end
end
