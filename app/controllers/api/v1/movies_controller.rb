module Api
  module V1
    class MoviesController < ApplicationController
      before_action :authenticate_user!            
      before_action :movie, only: [:show, :update, :destroy]
      def index

        render json: movies, each_serializer: MovieSerializer, status: :ok
      end
    
      def show
        movie

        render json: movie, serializer: ShowMovieSerializer::MovieSerializer, status: :ok
      end
    
      def update
        if movie.update(parameters)
          render json: movie, serializer: UpdateMovieSerializer::MovieSerializer, status: :ok
        else
          render json: { error: "The movie couldn't be updated" }, status: unprocessable_entity
        end    
      end
    
      def create
        create_movie = Movie.new(parameters)

        if create_movie.save
          render json: create_movie, serializer: CreateMovieSerializer::MovieSerializer, status: :created
        else
          render json: { error: "The movie couldn't be created" }, status: unprocessable_entity
        end
      end
    
      def destroy
        movie.destroy

        if movie.destroyed?
          # render json: { message: "The movie was deleted" }, status: :ok
          head 204
        else          
          render json: { error: "The movie couldn't be deleted" }, status: unprocessable_entity
        end  
      end

      private
        def movie
          @movie ||= Movie.find(params[:id])
        end

        def movies
          @movies ||= fetch_movies
        end

        def fetch_movies
          movies = Movie.all
          movies = movies.for_name(name) if name
          movies = movies.for_genre(genre) if genre
          movies = movies.order_by_release_date(order) if order
          movies
        end

        def name
          params[:name]
        end

        def genre
          params[:genre]
        end

        def order
          params[:order]
        end

        def parameters
          params.permit(:title, :release_date, :image, :rating, :genre_id)
        end

    end
  end
end