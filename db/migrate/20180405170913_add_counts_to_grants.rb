class AddCountsToGrants < ActiveRecord::Migration[5.1]
  def change
    add_column :grants, :ping_count, :integer
    add_column :grants, :resource_count, :integer
  end
end
