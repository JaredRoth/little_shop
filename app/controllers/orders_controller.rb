class OrdersController < ApplicationController
  before_action :require_login

  def create
    order = current_user.orders.create
    order_builder = OrderBuilder.new(@cart, order)
    if order_builder.create
      session[:cart] = {}
      flash[:notice] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to cart_path
    end
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by(id: params[:id]) || not_found
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
