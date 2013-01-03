class CreateTireFuelConsumptions < ActiveRecord::Migration
  def change
    create_table :tire_fuel_consumptions do |t|
      t.string :name

      t.timestamps
    end
  end
end
