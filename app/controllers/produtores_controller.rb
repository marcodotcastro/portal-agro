class ProdutoresController < ApplicationController
  before_action :set_produtor, only: [:show]
   
  def index
    @q = Produtor.ransack(params[:q])
    @produtores = @q.result(distinct: true)
  end
   
  def show
  end
  
  private
    def set_produtor
      @produtor = Produtor.find(params[:id])
    end

end
