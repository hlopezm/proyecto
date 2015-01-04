class Report
  attr_reader :items

  def self.build_from_hash hash
    items = if hash["report"] then
      hash["report"]["items"].map do |item_data|
      ReportItem.new item_data["project_id"], item_data["quantity"]
      end
    else
      []
    end
    new items
  end

  def initialize items = []
    @items = items
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

  def count
    @items.length
  end

  def serialize
    items = @items.map do |item| 
      { 
        "project_id" => item.project_id,
        "quantity" => item.quantity
      }
    end

    {
      "items" => items
    }
  end

  def total_price
    @items.inject(0) { | sum, item | sum + item.total_price }
  end
end
