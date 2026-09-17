class HomeController < ApplicationController
  layout "application"

  def index
    @product = Product.published.order("RANDOM()").first || Product.first
    @products = Product.published.limit(3)
    @products = Product.limit(3) if @products.empty?
    @services = Service.limit(3)
    @producers = Producer.published.limit(3)
    @producers = Producer.limit(3) if @producers.empty?
  end
end
