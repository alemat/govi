class PartnerTypesController < ApplicationController
  before_action :set_partner_type, only: %i[ show edit update destroy ]

  # GET /partner_types or /partner_types.json
  def index
    @partner_types = PartnerType.all
    @partner_type = PartnerType.new
  end

  # GET /partner_types/1 or /partner_types/1.json
  def show
  end

  # GET /partner_types/new
  def new
    @partner_type = PartnerType.new
  end

  # GET /partner_types/1/edit
  def edit
  end

  # POST /partner_types or /partner_types.json
  def create
    @partner_type = PartnerType.new(partner_type_params)

    respond_to do |format|
      if @partner_type.save
        format.html { redirect_to partner_types_path, notice: "Partner type was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partner_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partner_types/1 or /partner_types/1.json
  def update
    respond_to do |format|
      if @partner_type.update(partner_type_params)
        format.html { redirect_to partner_types_path, notice: "Partner type was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partner_types/1 or /partner_types/1.json
  def destroy
    @partner_type.destroy!

    respond_to do |format|
      format.html { redirect_to partner_types_path, status: :see_other, notice: "Partner type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner_type
      @partner_type = PartnerType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def partner_type_params
      params.expect(partner_type: [ :name, :description ])
    end
end
