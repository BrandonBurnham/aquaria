class CreateInhabitants < ActiveRecord::Migration
  def change
    create_table :inhabitants do |t|
      t.string :inhabitant_type
      t.string :name
      t.string :description
      t.integer :quantity
      t.references :aquarium, index: true

      t.timestamps
    end
  end
end
