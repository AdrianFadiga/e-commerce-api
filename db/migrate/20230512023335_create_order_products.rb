class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products, id: :uuid do |t|
      t.integer :quantity
      t.float :total_price
      t.belongs_to :order, type: :uuid, foreign_key: true
      t.belongs_to :product, type: :uuid, foreign_key: true
    end
  end
end
