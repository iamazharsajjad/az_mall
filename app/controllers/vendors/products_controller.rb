# frozen_string_literal: true

module Vendors
  class ProductsController < MainController
    def index
      @products = current_vendor.products.all
    end

    def show
      @product = current_vendor.products.find_by(title: params[:slug])
    end

    def new
      @product = current_vendor.products.new
    end

    def create
      @product = current_vendor.products.new(product_params.except(:categories))
      create_or_delete_products_categories(@product, params[:product][:categories])

      if @product.save
        redirect_to vendors_product_path(@product)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @product = current_vendor.products.find(params[:id])
    end

    def update
      @product = current_vendor.products.find(params[:id])
      create_or_delete_products_categories(@product, params[:product][:categories])

      if @product.update(product_params.except(:categories))
        redirect_to vendors_product_path(@product)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product = current_vendor.products.find(params[:id])
      @product.destroy

      redirect_to root_path, status: :see_other
    end

    private

      def product_params
        params.require(:product).permit(:title, :description, :price, :currency, :tags)
      end

      def create_or_delete_products_categories(product, categories)
        product.product_categories.destroy_all
        categories = categories.strip.split(',')
        categories.each do |category|
          product.categories << Category.find_or_create_by(name: category)
        end
      end
  end
end
