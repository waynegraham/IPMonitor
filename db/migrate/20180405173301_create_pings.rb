class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings do |t|
      t.boolean :status
      t.boolean :latest
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
