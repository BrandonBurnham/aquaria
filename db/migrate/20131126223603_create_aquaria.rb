class CreateAquaria < ActiveRecord::Migration
  def change
    create_table :aquaria do |t|
      t.string :name
      t.string :location
      t.integer :gallons
      t.string :type

      t.timestamps
    end
  end
end
