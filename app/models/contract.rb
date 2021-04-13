# frozen_string_literal: true

class Contract < ApplicationRecord
  validates :start_date, presence: true
  validates :number, presence: true, uniqueness: true
  has_many :clients_contracts
  has_many :clients, through: :clients_contracts
  has_many :contracts_options
  has_many :options, through: :contracts_options

  before_validation :number_contract, on: :create


  scope :pending, -> { where(status: 'pending') }
  scope :active, -> { where(status: 'active') }
  scope :finished, -> { where(status: 'finished') }

  def self.to_json(contract)
    {
      id: contract.id,
      number: contract.number,
      status: contract.status,
      start_date: contract.start_date,
      end_date: contract.end_date,
      clients_email: contract.clients.pluck(:email),
      options: contract.options
    }
    # clients_email could be replace by the full_name of all clients are on the contract
  end

  def number_contract
    self.number = (Contract.count + 1)  + ([*('0'..'9')] - %w[0 1 I O]).sample(5).join.to_i
  end
end
