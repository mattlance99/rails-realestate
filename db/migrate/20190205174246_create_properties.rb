class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :agent_id
      t.integer :client_id

      t.timestamps
    end
  end
end
