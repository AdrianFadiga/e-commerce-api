class ShoppingCartProduct < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0, only_integer: true }, presence: true
  validate :valid_product_id

  belongs_to :shopping_cart
  belongs_to :product

  private

  def valid_product_id
    errors.add(:product_id, 'is invalid') unless Product.exists?(id: product_id)
  end
end
