class MoviesController < ApplicationController
  def create
    begin
      Movie.create get_form_data

      redirect_to movies_path
    rescue
      redirect_to new_movie_path
    end
  end

  def edit
    @movie = Movie.find params[:id]
    prepare_form_selects_values
  end

  def get_form_data
    data = params.require(:movie).permit!

    country = Country.find params[:origin_country_id]
    director = Director.find params[:director_id]
    genre = Genre.find params[:genre_id]


    {
      title: data[:title], length: data[:length],
      synopsis: data[:synopsis], release_year: data[:release_year],
      genre: genre, director: director, origin_country: country
    }
  end

  def index
    @movies = Movie.all
  end

  def new
    prepare_form_selects_values
  end

  def prepare_form_selects_values
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
    @directors = Director.all.map { |director| [director.name, director.id] }
    @countries = Country.all.map { |country| [country.name, country.id] }
  end

  def update
    begin
      Movie.find(params[:id]).update get_form_data

      redirect_to movies_path
    rescue
      redirect_to new_movie_path
    end
  end
end
