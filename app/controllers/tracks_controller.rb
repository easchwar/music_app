class TracksController < ApplicationController
  before_action :require_login
  
  def new
    @track = Album.find(params[:album_id]).tracks.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])

    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :track_type, :lyrics)
  end
end
