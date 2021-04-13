# frozen_string_literal: true

class ClientsContract < ApplicationRecord
  belongs_to :client
  belongs_to :contract

  validates_uniqueness_of :client_id, scope: :contract_id
end
