class AddEconomyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :economy, :float
  end
end
