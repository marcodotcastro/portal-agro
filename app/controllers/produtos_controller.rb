class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show]
   
  def index
    @produtos = Produto.all
  end

  def show
  end
  
  private
    def set_produto
      @produto = Produto.find(params[:id])
    end

end
