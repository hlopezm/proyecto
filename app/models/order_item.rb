class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :project

  def total_price
    self.quantity * self.project.price
  end
end
