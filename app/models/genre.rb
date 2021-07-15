class Genre < ApplicationRecord
    has_many :movies

    # Validations
    validates :name,
              :image,
              presence: true
end
