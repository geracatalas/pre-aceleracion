module Api
  module V1
    class CharactersController < ApplicationController
      def index

        render json: characters, each_serializer: CharacterSerializer, status: :ok
      end
    
      def show
        character

        render json: character, serializer: ShowCharacterSerializer::CharacterSerializer, status: :ok
      end
    
      def update
        if character.update(parameters)
          render json: movie, serializer: UpdateCharacterSerializer::CharacterSerializer, status: :ok
        else
          render json: { error: "The character couldn't be updated" }, status: unprocessable_entity
        end         
      end
    
      def create
        create_character = Character.new(parameters)

        if create_character.save
          render json: create_character, serializer: CreateCharacterSerializer::CharacterSerializer, status: :created
        else
          render json: { error: "The character couldn't be created" }, status: unprocessable_entity
        end
      end
    
      def destroy
        character.destroy

        if character.destroyed?
          # render json: { message: "The character was deleted" }, status: :ok
          head 204
        else          
          render json: { error: "The character couldn't be deleted" }, status: unprocessable_entity
        end  
      end

      private
        def character
          @character ||= Character.find(params[:id])
        end

        def characters
          @characters ||= fetch_characters
        end

        def fetch_characters
          characters = Character.all
          characters = characters.for_name(name) if name
          characters = characters.for_age(age) if age
          characters = characters.for_idMovie(idMovie) if idMovie
          characters
        end

        def name
          params[:name]
        end

        def age
          params[:age]
        end

        def idMovie
          params[:idMovie]
        end

        def parameters
            params.permit(:name,:age,:weight,:image,:history,:movie_id)
        end    
        
    end
  end
end