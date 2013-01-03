class RenameFieldInVariant < ActiveRecord::Migration
  def up
    rename_column :spree_variants, :tire_fuel_consumtion_id, :tire_fuel_consumption_id
    
  end

  def down
  end
end
