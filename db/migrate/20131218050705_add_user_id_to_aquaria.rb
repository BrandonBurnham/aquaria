class AddUserIdToAquaria < ActiveRecord::Migration
  def change
    add_column :aquaria, :user_id, :integer
  end
end
