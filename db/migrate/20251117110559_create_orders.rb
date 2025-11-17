class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :external_id
      t.datetime :placed_at, null: false
      t.datetime :locked_at

      t.timestamps
    end
    add_index :orders, :external_id, unique: true
  end
end
