class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    3.times { @song.notes.build }
  end

  def show
    @song = Song.find(params[:id])
  end
   
  def create
    @song = Song.create(song_params(:title, :artist_name, :genre_id, notes_attributes: [:content]))
    
    redirect_to song_path(@song)
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end


  # def destroy
  #   @song = Song.find(params[:id])
  #   @song.destroy
  #   flash[:notice] = "Song deleted."
  #   redirect_to songs_path
  # end

end

