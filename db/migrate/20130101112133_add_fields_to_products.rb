class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :spree_variants, :tire_fuel_consumtion_id, :integer
    add_column :spree_variants, :tire_wet_grip_id, :integer
    add_column :spree_variants, :tire_rolling_noise_db, :integer
    add_column :spree_variants, :tire_rolling_noise_wave, :integer
  end
end
