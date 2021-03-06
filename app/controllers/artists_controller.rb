class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new

    render partial: "form"
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to billboard_path(@billboard)
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @artist.update
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end


  private

  

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end

end
