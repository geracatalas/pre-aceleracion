module Api
  module V1
    module CreateMovieSerializer
      class MovieSerializer < ApplicationSerializer
        attributes :id,
                   :image,
                   :title,
                   :release_date,
                   :rating,
                   :genre_id,
                   :created_at

        # has_one :genre
      end
    end
  end
end