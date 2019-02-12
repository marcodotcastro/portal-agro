class ProdutoresController < ApplicationController
  before_action :set_produtor, only: [:show]
   
  def index
    @produtores = Produtor.all
  end
   
  def show
  end
  
  private
    def set_produtor
      @produtor = Produtor.find(params[:id])
    end

end
