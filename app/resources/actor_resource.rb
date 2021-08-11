class ActorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :bio, :string
  attribute :dob, :date
  attribute :image, :string

  # Direct associations

  has_many   :roles,
             resource: CharacterResource,
             foreign_key: :actors_id

  # Indirect associations

  many_to_many :movies
end
