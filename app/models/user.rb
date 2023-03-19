# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_one :shopping_cart
  after_create :build_shopping_cart

  enum role: { customer: 'customer', admin: 'admin' }

  private

  def create_shopping_cart
    shopping_cart.create
  end
end
