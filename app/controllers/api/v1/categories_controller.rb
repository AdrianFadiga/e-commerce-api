module Api::V1
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show update destroy products]
    before_action :authenticate_admin!, only: %i[create update destroy]

    def index
      render json: Category.all
    end

    def show
      @category = Category.find(params[:id])
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def destroy
      render json: @category.errors, status: :unprocessable_entity unless @category.destroy
    end

    def products
      render json: @category.products
    end

    private

    def set_category
      @category = Category.find_by(id: params[:id])
      render json: { category: 'Category not found' }, status: :not_found if @category.nil?
    end

    def category_params
      params.require(:category).permit(:id, :name)
    end
  end
end
