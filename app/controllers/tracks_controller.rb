class TracksController < ApplicationController
  def new
    @track = Track.new
    render :new
  end

  def create
  end

  def show
    @track = Track.find(params[:id])

    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
