class CommonInterestsController < ApplicationController
  before_action :set_common_interest, only: %i[show edit update destroy]

  # GET /common_interests or /common_interests.json
  def index
    @common_interests = CommonInterest.all
  end

  # GET /common_interests/1 or /common_interests/1.json
  def show; end

  # GET /common_interests/new
  def new
    @common_interest = CommonInterest.new
  end

  # GET /common_interests/1/edit
  def edit; end

  # POST /common_interests or /common_interests.json
  def create
    @common_interest = CommonInterest.new(common_interest_params)

    respond_to do |format|
      if @common_interest.save
        format.html do
          redirect_to @common_interest,
                      notice: 'Common interest was successfully created.'
        end
        format.json do
          render :show, status: :created, location: @common_interest
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @common_interest.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /common_interests/1 or /common_interests/1.json
  def update
    respond_to do |format|
      if @common_interest.update(common_interest_params)
        format.html do
          redirect_to @common_interest,
                      notice: 'Common interest was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @common_interest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @common_interest.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /common_interests/1 or /common_interests/1.json
  def destroy
    @common_interest.destroy
    respond_to do |format|
      format.html do
        redirect_to common_interests_url,
                    notice: 'Common interest was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_common_interest
    @common_interest = CommonInterest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def common_interest_params
    params.require(:common_interest).permit(:name)
  end
end
