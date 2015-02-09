class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :find_categories
  before_action :find_portfolios
  before_filter :configure_permitted_parameters, if: :devise_controller?  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end

  def initialize_report
    @report = Report.build_from_hash session
  end

  def find_categories
    @categories = Category.all
  end

  def find_portfolios
    @portfolios = Portfolio.all
  end

  def authenticate_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: "No estas autorizado a realizar esta operación"
    end
  end

end
