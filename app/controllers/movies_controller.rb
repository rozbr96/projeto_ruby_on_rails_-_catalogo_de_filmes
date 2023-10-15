class MoviesController < ApplicationController
  def create
    data = params.require(:movie).permit!

    country = Country.find params[:origin_country_id]
    director = Director.find params[:director_id]
    genre = Genre.find params[:genre_id]

    begin
      Movie.create!(
        title: data[:title], length: data[:length],
        synopsis: data[:synopsis], release_year: data[:release_year],
        genre: genre, director: director, origin_country: country
      )

      redirect_to movies_path
    rescue
      redirect_to new_movie_path
    end
  end

  def edit
    @movie = Movie.find params[:id]
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
    @directors = Director.all.map { |director| [director.name, director.id] }
    @countries = Country.all.map { |country| [country.name, country.id] }
  end

  def index
    @movies = Movie.all
  end

  def new
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
    @directors = Director.all.map { |director| [director.name, director.id] }
    @countries = Country.all.map { |country| [country.name, country.id] }
  end

  def update
    data = params.require(:movie).permit!

    movie = Movie.find params[:id]
    country = Country.find params[:origin_country_id]
    director = Director.find params[:director_id]
    genre = Genre.find params[:genre_id]

    begin
      movie.update!(
        title: data[:title], length: data[:length],
        synopsis: data[:synopsis], release_year: data[:release_year],
        genre: genre, director: director, origin_country: country
      )

      redirect_to movies_path
    rescue
      redirect_to new_movie_path
    end
  end
end
