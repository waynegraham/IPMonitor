class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.timestamps
    end

    add_index :institutions, :name

  end
end
