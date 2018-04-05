class AddCountsToGrants < ActiveRecord::Migration[5.1]
  def change
    add_column :grants, :resources_count, :integer
  end
end
