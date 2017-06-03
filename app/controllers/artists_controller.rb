class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]


  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    render partial: 'form', local { title: 'New'}
  end

  def create
    @artist = Artist.new(artist_params)

    if @billboard.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    render partial: 'form', locals: { title: 'Edit' }
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end

  def show
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :age, :bio)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
