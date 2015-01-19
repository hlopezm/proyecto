class OrdersController < ApplicationController
  before_filter :initialize_report

  def index
    @orders = Order(created_at: :desc).all
  end
  def create
    @order_form = OrderForm.new(
      user: User.new(order_params[:user]),
      report: @report
    )

    if @order_form.save
      notify_user
      redirect_to root_path, notice: "Envio de reporte completado"
    else
      render "reports/checkout"
    end
  end

  private

  def notify_user
    @order_form.user.send_reset_password_instructions
    OrderMailer.order_confirmation(@order_form.order).deliver
  end

  def order_params
    params.require(:order_form).permit(
      user: [ :name, :email, :address, :phone, :city, :country, :postal_code ]
    )
  end
end
