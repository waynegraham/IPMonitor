class CreateGrants < ActiveRecord::Migration[5.1]
  def change
    create_table :grants do |t|
      t.string :grant_number
      t.string :primary_contact
      t.string :email
      t.string :phone
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
