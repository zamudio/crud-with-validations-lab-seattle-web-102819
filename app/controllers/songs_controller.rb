class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        song_find
    end

    def new
        @song = Song.new
    end
    
    def create
        @song = Song.new (song_params)

        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def edit
        song_find
    end

    def update
        song_find
        if @song.update(song_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        song_find
        @song.destroy
        redirect_to songs_url
    end

    private

    def song_find
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end
end
