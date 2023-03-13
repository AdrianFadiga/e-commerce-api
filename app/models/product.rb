class Product < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }, presence: true
  validates :price, numericality: { greater_than: 1 }, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }, presence: true

  belongs_to :category
end
