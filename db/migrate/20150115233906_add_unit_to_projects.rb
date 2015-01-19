class AddUnitToProjects < ActiveRecord::Migration
  def change
    unit = Unit.create! name: "Sin Unidad"
    add_reference :projects, :unit, index: true, default: unit.id
    add_foreign_key :projects, :units
  end
end
