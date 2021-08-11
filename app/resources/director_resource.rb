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

  has_many :characters do
    assign_each do |director, characters|
      characters.select do |c|
        c.id.in?(director.characters.map(&:id))
      end
    end
  end

end
