module Api
  module V1
    class MovieSerializer < ApplicationSerializer
      attributes :id,
                 :image,
                 :title,
                 :release_date
                 
    end
  end
end