class AddIndexToAquaria < ActiveRecord::Migration
  def change
    add_index :aquaria, [:user_id, :created_at]
  end
end
