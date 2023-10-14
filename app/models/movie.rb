class Movie < ApplicationRecord
  belongs_to :origin_country, class_name: 'Country'
  belongs_to :director
  belongs_to :genre
end
