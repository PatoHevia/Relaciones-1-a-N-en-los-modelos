class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy] # Agregamos destroy
  
  def index
    @movies = Movie.includes(:clients).all
  end  

  def show
    # @movie ya está cargado por el before_action
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: 'Película creada con éxito.'
    else
      render :new
    end
  end

  def edit
    # @movie ya está cargado por el before_action
  end

  def update
    # @movie ya está cargado por el before_action
    if params[:movie][:client_ids].present?
      client = Client.find(params[:movie][:client_ids])
      client.update(movie: @movie)
    end

    if @movie.update(movie_params)
      redirect_to movies_path, notice: 'Película actualizada con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: 'Película eliminada con éxito.'
  end

  private

  # Método para cargar la película
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Parámetros permitidos para las películas
  def movie_params
    params.require(:movie).permit(:title, :genre, client_ids: [])
  end
end
