class OrdersController < ApplicationController
    

    def create
        @order = Order.new(order_params)
        @order.total_price = @order.quantity * @order.book.price
        if @order.save
          render json: { message: 'Order created successfully' }, status: :created
        else
          render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def index
        @orders = user.orders
        render json: @orders, status: :ok
      end
    
      private
      
  def order_params
    params.permit(:book_id, :quantity, :total_price).merge(user_id: user.id)
  end

end
