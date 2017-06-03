class SongsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    render partial: 'form', locals: { title: 'New' }
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    render partial: 'form', locals: { title: 'Edit' }
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end

    def show
    end

    private

    def song_params
      params.require(:song).permit(:title, :artist, :album)
    end

    def set_song
      @song = Song.find(params[:id])
    end
end
