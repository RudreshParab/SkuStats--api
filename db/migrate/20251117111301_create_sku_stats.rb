class CreateSkuStats < ActiveRecord::Migration[8.0]
  def change
    create_table :sku_stats, id: :uuid do |t|
      t.string :sku
      t.string :week
      t.integer :total_quantity

      t.timestamps
    end
  end
end
