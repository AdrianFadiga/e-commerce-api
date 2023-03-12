class Category < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }

  has_many :products
end
