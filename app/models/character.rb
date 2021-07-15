class Character < ApplicationRecord
  # Associations
  belongs_to :movie
  
  # Scopes
  scope :for_name, -> (name) { where name: name}
  scope :for_age, -> (age) { where age: age}
  scope :for_movies, -> (movies) { where movie_id: movies}

  # Validations  
  validates :image,
            :name,
            :age,
            :weight,
            :history,
            :movie_id,
            presence: true

end
