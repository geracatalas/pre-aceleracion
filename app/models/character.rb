class Character < ApplicationRecord
  # Associations
  belongs_to :movie
  
  # Scopes
  scope :for_name, -> (name) { where name: name}
  scope :for_age, -> (age) { where age: age}
  scope :for_idMovie, -> (idMovie) { where movie_id: idMovie}
end
