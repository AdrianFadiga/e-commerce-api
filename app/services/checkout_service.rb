class CheckoutService < ApplicationService
  attr_reader :user, :shopping_cart_products

  def initialize(user, shopping_cart_products)
    @user = user
    @shopping_cart_products = shopping_cart_products
  end

  def call
    handle
  end

  private

  def handle
    Order.transaction do
      order = @user.orders.create!

      @shopping_cart_products.each do |scp|
        product = scp.product
        quantity = scp.quantity

        if product.quantity >= quantity
          order.order_products.create!(product: product, quantity: quantity)
          product.update!(quantity: product.quantity - quantity)
        else
          raise ActiveRecord::Rollback, "#{product.name} does not have enough quantity in stock."
        end
      end
    end
    # rescue ActiveRecord::RecordInvalid, ActiveRecord::Rollback => e
    #   # handle exceptions and return a meaningful error message
    #   { success: false, error: e.message }
    # else
    #   { success: true, message: 'Order has been created successfully.' }
    # end
  end
end
