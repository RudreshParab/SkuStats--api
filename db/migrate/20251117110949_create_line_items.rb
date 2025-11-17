class CreateLineItems < ActiveRecord::Migration[8.0]
  def change
    create_table :line_items, id: :uuid do |t|
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.string :sku
      t.integer :quantity
      t.boolean :original, default: true

      t.timestamps
    end
  end
end
