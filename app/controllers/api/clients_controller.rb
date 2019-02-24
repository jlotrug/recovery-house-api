require 'pry'

class Api::ClientsController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    @clients = Client.all
    render json: @clients

  end

  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client
    end

  end


private
  def client_params
    params.require(:client).permit(:name, :age, :job, :chore)
  end
end