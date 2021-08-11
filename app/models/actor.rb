class Actor < ApplicationRecord
  # Direct associations

  has_many   :roles,
             :class_name => "Character",
             :foreign_key => "actors_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
