class ProducersController < ApplicationController
  before_action :set_producer, only: [:show]

  def index
    @q = Producer.published.ransack(params[:q])
    @producers = @q.result(distinct: true).page(params[:page])
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @products = @producer.products.page(params[:page])
    @services = @producer.services.page(params[:page])
  end

  private

  def set_producer
    @producer = Producer.friendly.find(params[:id])
  end
end
