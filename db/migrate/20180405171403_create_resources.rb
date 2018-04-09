class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :file_name
      t.string :url
      t.string :checksum
      t.string :slug
      t.boolean :active, default: true
      t.string :access
      t.integer :pings_count
      t.integer :statuses_count
      t.references :grant, foreign_key: true

      t.timestamps
    end
  end
end
