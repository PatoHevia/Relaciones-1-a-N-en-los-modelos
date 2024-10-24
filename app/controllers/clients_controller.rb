class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
    # @client ya está cargado por el before_action
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: 'Cliente creado con éxito.'
    else
      render :new
    end
  end

  def edit
    # @client ya está cargado por el before_action
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: 'Cliente actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Cliente eliminado con éxito.'
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :movie_id) # Ajusta los campos permitidos
  end
end
