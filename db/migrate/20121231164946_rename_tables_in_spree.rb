class RenameTablesInSpree < ActiveRecord::Migration
  def up
    rename_table :tire_fuel_consumptions, :spree_tire_fuel_consumptions
    rename_table :tire_wet_grips, :spree_tire_wet_grips
  end

  def down
  end
end
