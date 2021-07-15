class Movie < ApplicationRecord
  belongs_to :genre
  has_many :characters

  # Scopes
  scope :for_name, -> (name) { where title: name }
  scope :for_genre, -> (genre) { where genre_id: genre }
  scope :order_by_release_date, -> (order) { order release_date: order }
end
