class Admin::ContractsController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_contract, only: %i[update]

  def index
    contracts = Contract.all.map do |contract|
      Contract.to_json(contract)
    end

    render json: {
      contracts: contracts
    }
    # Add a paginate
  end

  def create
    return unless params[:contracts][:option_ids].present? && params[:contracts][:client_ids].present? && params[:contracts][:start_date].present?

    contract = Contract.create!(contract_params)
    render json: {
      message: 'Contrat créé avec succès',
      contract: Contract.to_json(contract)
    }
  end

  def update
    end_date = params[:contracts][:end_date]
    return unless end_date.present? && @contract.end_date.nil?

    if end_date.to_date > Date.today
      @contract.update(end_date: end_date.to_date)
      render json: {
        message: 'Le contrat sera résilié le ' + end_date,
        contract: Contract.to_json(@contract)
      }
    else
      render json: { message: "Votre date de résiliation n'est pas valable"}
    end 
  end

  private

  def contract_params
    params.require(:contracts).permit(:start_date, client_ids: [], option_ids: [])
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
