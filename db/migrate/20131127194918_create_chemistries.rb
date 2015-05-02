class CreateChemistries < ActiveRecord::Migration
  def change
    create_table :chemistries do |t|
      t.float :water_ph
      t.float :water_nh3
      t.float :water_no3
      t.float :water_no2
      t.float :water_temp
      t.date :test_date
      t.references :aquarium, index: true

      t.timestamps
    end
  end
end
