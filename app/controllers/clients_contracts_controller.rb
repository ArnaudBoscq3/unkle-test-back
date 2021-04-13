class ClientsContractsController < ApplicationController
  before_action :authenticate_client!
  before_action :set_contract, only: %i[update]

  def index
    contracts = current_client.contracts.map do |contract|
      Contract.to_json(contract)
    end

    render json: {
      client: current_client,  
      contracts: contracts
    }
  end

  def update
    end_date = params[:contracts][:end_date]

    return unless end_date.present? && @contract.end_date.nil?

    if end_date.to_date >= Date.today && @contract.clients.where(email: current_client.email).present?
      @contract.update(end_date: end_date.to_date)
      render json: Contract.to_json(@contract)
    else
      render json: { message: "Votre date de résiliation n'est pas valable ou vous ne pouvez pas modifier ce contrat"}
    end 
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
