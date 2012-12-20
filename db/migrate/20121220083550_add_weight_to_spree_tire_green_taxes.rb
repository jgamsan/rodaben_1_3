class AddWeightToSpreeTireGreenTaxes < ActiveRecord::Migration
  def change
    add_column :spree_tire_green_taxes, :weight_min, :decimal, :precision => 8, :scale => 2, :null => false, :after => :description
    add_column :spree_tire_green_taxes, :weight_max, :decimal, :precision => 8, :scale => 2, :null => false, :after => :description
  end
end
