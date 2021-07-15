module Api
  module V1
    module UpdateMovieSerializer
      class MovieSerializer < ApplicationSerializer
        attributes :id,
                   :image,
                   :title,
                   :release_date,
                   :rating,
                   :genre_id,
                   :updated_at

        # has_one :genre
      end
    end
  end
end