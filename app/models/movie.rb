class Movie < ApplicationRecord
  belongs_to :origin_country, class_name: 'Country'
  belongs_to :director
  belongs_to :genre

  has_one_attached :poster do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
end
