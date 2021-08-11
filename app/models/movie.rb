class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director

  has_many   :roles,
             :class_name => "Character",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end

end
