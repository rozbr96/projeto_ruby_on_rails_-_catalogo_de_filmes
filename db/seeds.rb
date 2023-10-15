# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

File.open "db#{File::SEPARATOR}countries_nationalities.txt" do |file|
  file.readlines.each do |line|
    country_name, nationality_name = line.chomp('\n').split(' - ')

    country = Country.find_or_create_by(name: country_name)
    Nationality.find_or_create_by(name: nationality_name, country: country)
  end
end
