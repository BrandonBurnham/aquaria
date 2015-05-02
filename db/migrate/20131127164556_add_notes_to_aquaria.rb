class AddNotesToAquaria < ActiveRecord::Migration
  def change
    add_column :aquaria, :notes, :string
  end
end
