module Api::V1
  class ShoppingCartsController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_shopping_cart_products

    def show
      render json: @shopping_cart_products.as_json(include: :product)
    end

    def update
      new_product = @shopping_cart_products.find_or_initialize_by(product_id: params[:product_id])
      new_product.assign_attributes(quantity: params[:quantity])
      if new_product.save
        render json: @shopping_cart_products
      else
        render json: { error: new_product.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      product = @shopping_cart_products.find_by(product_id: params[:product_id])
      if product.nil?
        render json: { error: 'Product not found' }, status: :unprocessable_entity
      else
        product.destroy
        render status: :ok
      end
    end

    def checkout
      CheckoutService.call(current_api_user, @shopping_cart_products)
    end

    private

    def set_shopping_cart_products
      @shopping_cart_products = current_api_user.shopping_cart.shopping_cart_products
    end

    def shopping_cart_params
      params.require(:shopping_cart).permit(:product_id, :quantity)
    end
  end
end
