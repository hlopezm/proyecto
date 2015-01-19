class ExecutorsController < ApplicationController
  before_action :set_executor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @executors = Executor.all
    respond_with(@executors)
  end

  def show
    respond_with(@executor)
  end

  def new
    @executor = Executor.new
    respond_with(@executor)
  end

  def edit
  end

  def create
    @executor = Executor.new(executor_params)
    @executor.save
    respond_with(@executor)
  end

  def update
    @executor.update(executor_params)
    respond_with(@executor)
  end

  def destroy
    @executor.destroy
    respond_with(@executor)
  end

  private
    def set_executor
      @executor = Executor.find(params[:id])
    end

    def executor_params
      params.require(:executor).permit(:name)
    end
end
