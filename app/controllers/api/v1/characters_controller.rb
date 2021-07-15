module Api
  module V1
    class CharactersController < ApplicationController
      before_action :authenticate_user!            
      before_action :character, only: [:show, :update, :destroy]
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
          characters = characters.for_movies(movies) if movies
          characters
        end

        def name
          params[:name]
        end

        def age
          params[:age]
        end

        def movies
          params[:movies]
        end

        def parameters
            params.permit(:name,:age,:weight,:image,:history,:movie_id)
        end    
        
    end
  end
end