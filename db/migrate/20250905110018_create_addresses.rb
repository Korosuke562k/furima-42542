class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :post_code,              null: false
      t.integer :shipping_address_id,   null: false
      t.text    :city,                  null: false
      t.text    :street,                null: false
      t.text    :building_name
      t.string  :telephone,             null: false
      t.references :buy,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
