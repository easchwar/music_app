class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:error] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
