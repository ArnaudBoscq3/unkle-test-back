# frozen_string_literal: true

class Admin::ClientsController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_client, only: %i[show destroy]

  def index
    @clients = Client.with_contracts
    render json: @clients.to_json(include: :contracts)
    # Add a paginate
  end

  def show
    contracts = @client.contracts.map do |contract|
      Contract.to_json(contract)
    end

    render json: {
      client: @client,
      contracts: contracts
    }
  end

  def create
    client = Client.new(clients_params)
    client.password = ([*('A'..'Z'), *('0'..'9')] - %w[0 1 I O]).sample(8).join
    client.save!
    # Send email with login info or sms with Twilio
    render json: {
      message: 'Client créé avec succès',
      client: client
    }
  end

  def destroy
    @client.destroy! unless @client.contracts.where(status: %w[pending active]).present?
    render json: { message: 'Client supprimé avec succès' }
  end

  private

  def clients_params
    params.require(:clients).permit(:email)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
