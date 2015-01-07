class AddPortfolioToProjects < ActiveRecord::Migration
  def change
    portfolio = Portfolio.create! name: "N/A"
    add_reference :projects, :portfolio, index: true, default: portfolio.id
    add_foreign_key :projects, :portfolios
  end
end
