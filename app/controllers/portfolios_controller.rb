class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @portfolios = Portfolio.all
    respond_with(@portfolios)
  end

  def show
    @projects = @portfolio.projects
  end

  def new
    @portfolio = Portfolio.new
    respond_with(@portfolio)
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.save
    respond_with(@portfolio)
  end

  def update
    @portfolio.update(portfolio_params)
    respond_with(@portfolio)
  end

  def destroy
    @portfolio.destroy
    respond_with(@portfolio)
  end

  private
    def set_portfolio
      @portfolio = Portfolio.includes(:projects).find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:name)
    end
end
