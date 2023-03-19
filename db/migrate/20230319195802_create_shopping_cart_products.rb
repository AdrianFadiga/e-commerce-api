class CreateShoppingCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_cart_products, id: :uuid do |t|
      t.integer :quantity

      t.belongs_to :shopping_cart, type: :uuid, foreign_key: true
      t.belongs_to :product, type: :uuid, foreign_key: true
    end
  end
end
