class Character < ApplicationRecord
  # Direct associations

  belongs_to :actors,
             :class_name => "Actor"

  belongs_to :movie

  # Indirect associations

  has_one    :director,
             :through => :movie,
             :source => :director

  # Validations

  # Scopes

  def to_s
    name
  end

end
