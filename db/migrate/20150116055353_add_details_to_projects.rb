class AddDetailsToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
    t.string :location
    t.string :auth_number
    t.string :contract_number
    t.float :requested_amount
    t.float :authorized_amount
    t.datetime :start_date
    t.datetime :end_date
    t.string :contact
    t.string :target_set
    t.float :physical_progress
    t.float :financial_progress
    t.string :extension
    t.string :contract_modification
    t.datetime :delivery_date
    t.string :status
    t.string :observations
    end
  end
end
