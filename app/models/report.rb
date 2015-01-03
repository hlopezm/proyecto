class Report
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item project_id
    item = @items.find { |item| item.project_id == project_id }
    if item
      item.increment
    else
      @items << ReportItem.new(project_id)
    end
  end

  def empty?
    @items.empty?
  end

  def serialize
    items = @items.map do |item| 
      { 
        "project_id" => item.project_id,
        "quantity" => item.quantity
      }
    end

    {
      "report" => {
        "items" => items
      }
    }
  end
end
