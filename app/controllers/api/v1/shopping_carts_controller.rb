module Api::V1
  class ShoppingCartsController < ApplicationController
    before_action :set_shopping_cart, only: %i[show update destroy]
    def show
      render json: @shopping_cart.shopping_cart_products.as_json(include: :product)
    end

    def update
      shopping_cart_product = @shopping_cart.shopping_cart_products.find_or_initialize_by(product_id: params[:product_id])
      shopping_cart_product.assign_attributes(quantity: params[:quantity])
      if shopping_cart_product.save
        render json: @shopping_cart.shopping_cart_products
      else
        render json: { error: shopping_cart_product.errors }, status: :unprocessable_entity
      end
    end

    def destroy; end

    private

    def set_shopping_cart
      @shopping_cart = ShoppingCart.find_by(user_id: params[:id])
      render json: { shopping_cart: 'Shopping Cart not found' }, status: :not_found if @shopping_cart.nil?
    end

    def shopping_cart_params
      params.require(:shopping_cart).permit(:id, :product_id, :quantity)
    end
  end
end
