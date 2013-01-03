class ChangeNameToTable < ActiveRecord::Migration
  def up
    rename_table :spree_tire_green_taxes, :spree_tire_green_rates
    rename_column :spree_variants, :tire_green_tax_id, :tire_green_rate_id
  end

  def down
  end
end
