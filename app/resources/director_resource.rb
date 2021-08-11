class DirectorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :bio, :string
  attribute :dob, :date
  attribute :image, :string

  # Direct associations

  has_many   :filmography,
             resource: MovieResource

  # Indirect associations

end
