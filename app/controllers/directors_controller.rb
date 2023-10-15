class DirectorsController < ApplicationController
  def create
    begin
      Director.create get_form_data
      redirect_to directors_path
    rescue
      redirect_to new_director_path
    end

  end

  def edit
    @director = Director.find params[:id]
    prepare_form_selects_values
  end

  def get_form_data
    data = params.require(:director).permit!

    nationality = Nationality.find params[:nationality_id]
    favorite_genre = Genre.find params[:favorite_genre_id]

    {
      name: data[:name],
      nationality: nationality,
      birth_date: data[:birth_date],
      favorite_genre: favorite_genre
    }
  end

  def index
    @directors = Director.all
  end

  def new
    prepare_form_selects_values
  end

  def prepare_form_selects_values
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
    @nationalities = Nationality.all.map do |nationality|
      [nationality.name, nationality.id]
    end
  end

  def show
    @director = Director.find params[:id]
    @movies = Movie.where director_id: params[:id]
  end

  def update
    begin
      Director.find(params[:id]).update get_form_data
      redirect_to directors_path
    rescue
      redirect_to action: edit, id => params[:id]
    end
  end
end
