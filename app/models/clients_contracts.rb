# frozen_string_literal: true

class ClientsContract < ApplicationRecord
  belongs_to :client
  belongs_to :contract
end