class AddSoldToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :sold, :integer
  end
end
