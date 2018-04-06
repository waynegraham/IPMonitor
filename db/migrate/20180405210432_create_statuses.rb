class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.string :res_code
      t.string :res_message
      t.decimal :res_time
      t.text :status
      t.text :submitted_query
      t.boolean :latest
      t.references :resources, foreign_key: true

      t.timestamps
    end
  end
end
