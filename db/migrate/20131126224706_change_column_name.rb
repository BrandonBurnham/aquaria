class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :aquaria, :type, :water_type
  end
end
