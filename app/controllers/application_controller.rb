class ApplicationController < ActionController::Base
  def home
    @data = [
      [ 'Filmes', Movie.count ],
      [ 'Gêneros', Genre.count ],
      [ 'Diretores', Director.count ],
      [ 'Países', Country.count ],
      [ 'Nacionalidades', Nationality.count ]
    ]
  end
end
