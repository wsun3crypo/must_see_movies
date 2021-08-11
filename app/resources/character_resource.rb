class CharacterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :movie_id, :integer
  attribute :actors_id, :integer

  # Direct associations

  belongs_to :actors,
             resource: ActorResource

  belongs_to :movie

  # Indirect associations

end
