class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :director_id, :integer
  attribute :title, :string
  attribute :year, :string
  attribute :duration, :string
  attribute :image, :string
  attribute :numbers_of_characters, :string

  # Direct associations

  # Indirect associations

end
