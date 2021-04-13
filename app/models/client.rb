# frozen_string_literal: true

class Client < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :clients_contracts
  has_many :contracts, through: :clients_contracts, dependent: :destroy
  
  scope :with_contracts, -> { includes(:contracts) }
end
