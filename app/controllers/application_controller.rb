class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_categories
  before_action :find_portfolios

  def initialize_report
    @report = Report.build_from_hash session
  end

  def find_categories
    @categories = Category.all
  end

  def find_portfolios
    @portfolios = Portfolio.all
  end
end
