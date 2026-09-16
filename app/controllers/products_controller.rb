class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @q = Product.published.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
  end

  private

  def set_product
    @product = Product.friendly.find(params[:id])
  end
end
