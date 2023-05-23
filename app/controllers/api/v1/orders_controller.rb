module Api::V1
  class OrdersController < ApplicationController
    before_action :set_order, only: %i[show]

    # GET /orders
    def index
      @orders = Order.all

      render json: @orders
    end

    # GET /orders/1
    def show
      render json: @order
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id)
    end
  end
end
