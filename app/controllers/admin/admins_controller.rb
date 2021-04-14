class Admin::AdminsController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: %i[destroy]

  def index
    render json: Admin.all
  end

  def show
    render json: current_admin
  end

  def create
    admin = Admin.new(admins_params)
    admin.password = ([*('A'..'Z'), *('0'..'9')] - %w[0 1 I O]).sample(8).join
    admin.save!
    # Send email with login info
    render json: {
      message: 'Admin créé avec succès',
      admin: admin
    }
  end

  def destroy
    @admin.destroy!
    render json: { message: 'Admin supprimé avec succès' }
  end

  private

  def admins_params
    params.require(:admins).permit(:email)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
