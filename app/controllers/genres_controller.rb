class GenresController < ApplicationController
  def create
    begin
      Genre.create! params.require(:genre).permit(:name)
      redirect_to genres_path
    rescue
      render :new
    end
  end

  def edit
    @genre = Genre.find params[:id]
  end

  def index
    @genres = Genre.all
  end

  def new
  end

  def show
    @genre = Genre.find params[:id]
    @movies = Movie.where genre_id: params[:id]
  end

  def update
    genre = Genre.find params[:id]

    begin
      genre.update params.require(:genre).permit(:name)
      redirect_to genres_path
    rescue
      redirect_to :action => :edit, :id => params[:id]
    end
  end
end
