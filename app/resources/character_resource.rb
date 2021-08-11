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

  has_one    :director

  filter :director_id, :integer do
    eq do |scope, value|
      scope.eager_load(:director).where(:movies => {:director_id => value})
    end
  end
end
