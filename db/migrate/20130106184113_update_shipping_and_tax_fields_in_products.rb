class UpdateShippingAndTaxFieldsInProducts < ActiveRecord::Migration
  def up
    vehicles = Spree::Product.joins(:taxons).where("spree_taxons.id IN (:vehiculo)", {:vehiculo => [4,5,6,7,8]}).map {|x| x.id}
    Spree::Product.update_all({:tax_category_id => 1, :shipping_category_id => 1},['id IN (:p)', {:p => vehicles}])
    variantes_vehicles = Spree::Variant.joins(:product => :taxons).where("spree_taxons.id IN (:vehiculo)", {:vehiculo => [4,5,6,7,8]}).map {|x| x.id}
    Spree::Variant.update_all({:tire_green_rate_id => 2},['id IN (:p)', {:p => variantes_vehicles}])
    motos = Spree::Product.joins(:taxons).where("spree_taxons.id IN (:vehiculo)", {:vehiculo => [9]}).map {|x| x.id}
    Spree::Product.update_all({:shipping_category_id => 2},['id IN (:p)', {:p => motos}])
    variantes_motos = Spree::Variant.joins(:product => :taxons).where("spree_taxons.id IN (:motos)", {:motos => [9]}).map {|x| x.id}
    Spree::Variant.update_all({:tire_green_rate_id => 1},['id IN (:p)', {:p => variantes_motos}])
  end

  def down
  end
end
