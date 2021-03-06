class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.references :project, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :projects
  end
end
