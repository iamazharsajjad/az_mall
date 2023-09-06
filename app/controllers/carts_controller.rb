class CartsController < ApplicationController
	def show
	end

	def add
		@product = Product.find_by(id: params[:id])
		quantity = params[:quantity].to_i
		current_orderable = @cart.orderables.find_by(product_id: @product.id)
		if current_orderable && quantity > 0
			current_orderable.update(:quantity)
		elsif quantity <= 0 
			@cart.orderables.destroy
		else
			@cart.orderables.create(product: @product, quantity: quantity)
		end

		respond_to do |format|
			format.turbo_stream do
				render turbo_stream: [turbo_stream.replace('cart', partial: 'carts/cart', locals: {cart: @cart})]
			end
		end
	end

	def remove
		Orderable.find_by(id: params[:id]).destroy
		respond_to do |format|
			format.turbo_stream do
				render turbo_stream: [turbo_stream.replace('cart', partial: 'carts/cart', locals: {cart: @cart})]
			end
		end
	end

end
