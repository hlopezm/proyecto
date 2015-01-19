class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :initialize_report
  before_action :authenticate_admin!, only: [ :new ,:edit, :update, :create, :destroy ] 


  respond_to :html

  def index
    @q = params[:q]
    if @q
      @projects = Project.where("name like ?", "%#{@q}%")
    else
      @projects = Project.all
    end
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end


  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :price, :image, :category_id, :portfolio_id, :executor_id, :unit_id, :target_set, :contract_number, :requested_amount, :start_date, :end_date, :contact, :physical_progress, :financial_progress, :extension, :contract_modification, :delivery_date, :status, :observations, :auth_number, :location)
    end
end
