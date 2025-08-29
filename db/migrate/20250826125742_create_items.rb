class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string  :name,                null: false
      t.text    :text,                null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_fee_id,     null: false
      t.integer :shipping_address_id, null: false
      t.integer :shipping_days_id,    null: false
      t.integer :amount,              null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
