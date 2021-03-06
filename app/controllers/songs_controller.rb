class SongsController < ApplicationController

def index
	@songs = Song.all
end

def show
    @song = Song.find(params[:id])
  end

  def new
  	@song = Song.new()
  end

  def create
    @song = Song.new(song_params)
    if @song.valid? 
      @song.save
     redirect_to song_path(@song)
   else
    render :new
  end
end

def edit
	@song = Song.find(params[:id])
  end

  def update
    if @song.update(song_params)
      @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
end

  private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
