# frozen_string_literal: true

class Contract < ApplicationRecord
  validates :start_date, presence: true
  validates :numero, presence: true, uniqueness: true
  has_many :clients_contracts
  has_many :clients, through: :clients_contracts
  has_many :contracts_options
  has_many :options, through: :contracts_options

  scope :pending, -> { where(statut: 'pending') }
  scope :active, -> { where(statut: 'active') }
  scope :finished, -> { where(statut: 'finished') }
end
