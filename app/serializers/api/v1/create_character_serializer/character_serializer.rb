module Api
  module V1
    module CreateCharacterSerializer
      class CharacterSerializer < ApplicationSerializer
        attributes :id,
                   :image,
                   :name,
                   :age,
                   :weight,
                   :history,
                   :created_at

        has_one :movie, serializer: MovieSerializer
      end
    end
  end
end