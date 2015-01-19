class Project < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :price
  validates_numericality_of :price

  belongs_to :category
  belongs_to :portfolio
  belongs_to :executor
  belongs_to :unit


  def total_price
    @items.inject(0) { | sum, item | sum + item.total_price }
  end

end
