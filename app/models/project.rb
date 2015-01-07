class Project < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :price
  validates_numericality_of :price
  
  belongs_to :category
  belongs_to :portfolio
end
