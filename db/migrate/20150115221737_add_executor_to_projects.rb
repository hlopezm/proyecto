class AddExecutorToProjects < ActiveRecord::Migration
  def change
    executor = Executor.create! name: "Sin Ejecutor"
    add_reference :projects, :executor, index: true, default: executor.id
    add_foreign_key :projects, :executors
  end
end
