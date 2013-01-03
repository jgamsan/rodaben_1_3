class CreateTireWetGrips < ActiveRecord::Migration
  def change
    create_table :tire_wet_grips do |t|
      t.string :name

      t.timestamps
    end
  end
end
