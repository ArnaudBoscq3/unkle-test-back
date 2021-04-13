# frozen_string_literal: true

class Admin::ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end