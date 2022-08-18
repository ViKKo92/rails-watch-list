# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=4e4d706d7c0b73d245dbedcbf9865d83&language=en-US&page=1"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

movies = user["results"]

index = 0

Movie.destroy_all
List.destroy_all

10.times do
  movie = Movie.new(
    title: movies[index]["original_title"], 
    overview: movies[index]["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movies[index]["poster_path"]}",
    rating: movies[index]["vote_average"]
  )
  movie.save
  index = index + 1

List.create(name: "Classic movies")
List.create(name: "Fairy Tales")
List.create(name: "Documentaries")

end
