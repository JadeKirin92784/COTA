class ParsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @pars = Par.all
    @markers = @pars.geocoded.map do |par|
      {
        lat: par.latitude,
        lng: par.longitude
      }
    end
  end

  def show
    @par = Par.find(params[:id])
    @markers = [{
        lat: @par.latitude,
        lng: @par.longitude
      }]
  end

  def new
    @par = Par.new
  end

  def create
    @par = Par.new(par_params)
    if @par.save
      redirect_to @par, notice: "Park and Ride location created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def par_params
    params.require(:par).permit(:name, :latitude, :longitude)
  end
end
