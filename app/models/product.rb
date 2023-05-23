class Product < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }, presence: true
  validates :price, numericality: { greater_than: 1 }, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }, presence: true

  belongs_to :category
  has_many :shopping_cart_products
  has_many :shopping_carts, through: :shopping_cart_products
end
