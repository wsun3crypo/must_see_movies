json.extract! movie, :id, :description, :director_id, :title, :year, :duration,
              :image, :numbers_of_characters, :created_at, :updated_at
json.url movie_url(movie, format: :json)
