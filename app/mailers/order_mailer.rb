class OrderMailer < ActionMailer::Base
  default from: "hlopezm23@gmail.com"

  def order_confirmation order
    @order = order
    mail to: order_user_email, subject: "Tu reporte (##{order_id})"
  end
end
