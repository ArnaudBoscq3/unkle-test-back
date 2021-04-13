# frozen_string_literal: true

class Option < ApplicationRecord
  validates :title, presence: true
end
