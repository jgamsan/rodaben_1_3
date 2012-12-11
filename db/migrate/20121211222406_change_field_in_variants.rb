class ChangeFieldInVariants < ActiveRecord::Migration
  def up
  	remove_column :spree_variants, :tire_rf
    add_column :spree_variants, :tire_rf, :integer, :default => 1, :after => :tire_gr
  end

  def down
  end
end
