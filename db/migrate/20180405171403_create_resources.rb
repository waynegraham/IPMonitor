class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :file_name
      t.string :url
      t.string :checksum
      t.string :slug
      t.boolean :active
      t.string :access
      t.references :grant, foreign_key: true

      t.timestamps
    end
  end
end
