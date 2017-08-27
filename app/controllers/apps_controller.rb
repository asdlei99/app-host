class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy, :comments]

  def index
    unless User.admin.exists?
      redirect_to new_user_path and return
    end
    @apps = App.all
  end

  def show
    redirect_to app_plats_path @app
  end

  def new
    @app = App.new
  end

  def create
    app = App.create(app_params)
    redirect_to root_path
  end

  def edit
    render 'new'
  end

  def update
    @app.update app_params
    redirect_to root_path
  end

  def destroy
    @app.destroy!
    redirect_to root_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_app
    @app = App.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def app_params
    params.require(:app).permit(:name,:desc);
  end
end