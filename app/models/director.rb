class Director < ApplicationRecord
  belongs_to :nationality
  belongs_to :favorite_genre, class_name: 'Genre'
end
