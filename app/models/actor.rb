class Actor < ApplicationRecord
  # Direct associations

  has_many   :roles,
             :class_name => "Character",
             :foreign_key => "actors_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :movies,
             :through => :roles,
             :source => :movie

  # Validations

  # Scopes

  def to_s
    name
  end

end
