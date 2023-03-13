class Category < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 20 }, uniqueness: { case_sensitive: false }, presence: true

  has_many :products, dependent: :restrict_with_error
end
