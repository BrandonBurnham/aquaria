class CreateStatusLists < ActiveRecord::Migration
  def change
    create_table :status_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
