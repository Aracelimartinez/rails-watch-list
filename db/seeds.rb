# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating movies...'

movies = JSON.parse(RestClient.get('https://tmdb.lewagon.com/movie/top_rated'))['results'].first(10)

movies.each do |movie|
  image_url = 'https://image.tmdb.org/t/p/original'
  Movie.create(title: movie['original_title'], overview: movie['overview'], poster_url: "#{image_url}#{movie['poster_path']}", rating: movie['vote_average'])
end

puts 'Finished!'

puts 'Creating lists...'

List.create(name: 'Drama')
List.create(name: 'Comedy')
List.create(name: 'All time favourites')
List.create(name: 'Girl Power')
List.create(name: 'Action')

puts 'Finished!'
