class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  def index
    @services = Service.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  private

  def set_service
    @service = Service.friendly.find(params[:id])
  end
end
