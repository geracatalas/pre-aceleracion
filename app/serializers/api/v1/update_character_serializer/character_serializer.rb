module Api
  module V1
    module UpdateCharacterSerializer
      class CharacterSerializer < ApplicationSerializer
        attributes :id,
                   :image,
                   :name,
                   :age,
                   :weight,
                   :history,
                   :updated_at

        has_one :movie, serializer: MovieSerializer
      end
    end
  end
end