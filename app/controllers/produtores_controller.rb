class ProdutoresController < ApplicationController
  before_action :set_produtor, only: [:show]
   
  def show
  end
  
  private
    def set_produtor
      @produtor = Produtor.find(params[:id])
    end

end
