class OrdersController < ApplicationController
  before_action :load_products, only: [:new, :create]
  before_action :set_product, only: [:new, :create]

  def index
    @orders = Order.includes(product: :producer).order(created_at: :desc)
  end

  def new
    @order = Order.new(product: @product, quantity: 1)
  end

  def create
    @order = Order.new(order_params)
    @order.product = @product

    respond_to do |format|
      if @order.save
        format.turbo_stream
        format.html { redirect_to orders_path, notice: "Simulação de pedido registrada com sucesso!" }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.html do
          flash.now[:alert] = "Revise os campos destacados na simulação."
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def load_products
    @products = Product.published.order(:name)
    @products = Product.all.order(:name) if @products.empty?
  end

  def set_product
    product_id = params[:product_id].presence || params.dig(:order, :product_id).presence
    if product_id.present?
      @product = Product.friendly.find(product_id) rescue Product.find_by(id: product_id)
    end
    @product ||= @products.first

    if @product.nil?
      redirect_to products_path, alert: "Nenhum produto cadastrado para simulação no momento."
    end
  end

  def order_params
    params.require(:order).permit(:customer_name, :customer_contact, :quantity, :notes, :product_id)
  end
end
