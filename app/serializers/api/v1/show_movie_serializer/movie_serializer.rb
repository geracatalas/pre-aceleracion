module Api
  module V1
    module ShowMovieSerializer
      class MovieSerializer < ApplicationSerializer
        attributes :id,
                   :image,
                   :title,
                   :release_date,
                   :rating,
                   :genre_id

        has_many :characters, serializer: CharacterSerializer
      end
    end
  end
end