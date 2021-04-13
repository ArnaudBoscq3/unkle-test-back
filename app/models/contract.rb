# frozen_string_literal: true

class Contract < ApplicationRecord
  validates :start_date, presence: true
  validates :numero, presence: true, uniqueness: true

  scope :pending, -> { where(statut: 'pending') }
  scope :active, -> { where(statut: 'active') }
  scope :finished, -> { where(statut: 'finished') }
end
