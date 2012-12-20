class AddTireGreenTaxToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :tire_green_tax_id, :integer
  end
end
