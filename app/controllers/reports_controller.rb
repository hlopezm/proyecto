class ReportsController < ApplicationController
  before_filter :initialize_report

  def add
    @report.add_item params[:id]
    session["report"] = @report.serialize
    project = Project.find params[:id]
    redirect_to :back, notice: "#{project.name} agregado a reporte."
  end

  def show
  end
end
