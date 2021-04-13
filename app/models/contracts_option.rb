# frozen_string_literal: true

class ContractsOption < ApplicationRecord
  belongs_to :contract
  belongs_to :option
end