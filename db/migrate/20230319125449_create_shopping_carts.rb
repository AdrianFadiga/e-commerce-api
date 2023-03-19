class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true
    end
  end
end
