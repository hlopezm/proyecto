class ReportItem
  attr_reader :project_id, :quantity

  def initialize project_id, quantity = 1
    @project_id = project_id
    @quantity = quantity
  end

  def increment
    @quantity = @quantity + 1
  end

  def project
    Project.find project_id
  end

  def total_price
    project.price * quantity
  end
end
