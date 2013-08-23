class AddIndexInVariants < ActiveRecord::Migration
  def up
    add_index :spree_variants, :tire_width_id
    add_index :spree_variants, :tire_serial_id
    add_index :spree_variants, :tire_innertube_id
    add_index :spree_variants, :tire_speed_code_id
  end

  def down
  end
end
