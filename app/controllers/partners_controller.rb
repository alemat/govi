class PartnersController < ApplicationController
  before_action :set_partner, only: %i[ show edit update destroy ]

  # GET /partners or /partners.json
  def index
    @partners = Partner.all
    @partner = Partner.new
    @partner_type = PartnerType.new
  end

  # GET /partners/1 or /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners or /partners.json
  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: "Partner was successfully created." }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to @partner, notice: "Partner was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @partner.destroy!

    respond_to do |format|
      format.html { redirect_to partners_path, notice: "Partner was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.expect(partner: [ :partner_type_id, :name, :short_name, :phone, :email, :country, :city, :district, :status, :description ])
    end
end
