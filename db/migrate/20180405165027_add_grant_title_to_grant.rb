class AddGrantTitleToGrant < ActiveRecord::Migration[5.1]
  def change
    add_column :grants, :grant_title, :string
  end
end
