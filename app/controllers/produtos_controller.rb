class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show]
   
  def index
    @q = Produto.ransack(params[:q])
    @produtos = @q.result(distinct: true)
  end

  def show
  end
  
  private
    def set_produto
      @produto = Produto.friendly.find(params[:id])
    end

end
