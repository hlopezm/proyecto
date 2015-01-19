class CreateExecutors < ActiveRecord::Migration
  def change
    create_table :executors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
