class AddCategoryToProjects < ActiveRecord::Migration
  def change
    category = Category.create! name: "No category"
    add_reference :projects, :category, index: true, default: category.id
    add_foreign_key :projects, :categories
  end
end
