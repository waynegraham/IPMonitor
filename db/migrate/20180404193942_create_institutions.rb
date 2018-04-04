class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :primary_contact
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
