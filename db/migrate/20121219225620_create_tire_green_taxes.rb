class CreateTireGreenTaxes < ActiveRecord::Migration
  def change
    create_table :spree_tire_green_taxes do |t|
      t.string :cat
      t.string :description
      t.decimal :amount, :precision => 8, :scale => 2, :null => false
      t.string :currency, :default => Spree::Config[:currency]

      t.timestamps
    end
  end
end
