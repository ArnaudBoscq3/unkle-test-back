# frozen_string_literal: true

class Option < ApplicationRecord
  has_many :contracts_options
  has_many :contracts, through: :contracts_options
  validates :title, presence: true
end
