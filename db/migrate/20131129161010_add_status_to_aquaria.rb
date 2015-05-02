class AddStatusToAquaria < ActiveRecord::Migration
  def change
    add_column :aquaria, :status, :string
  end
end
