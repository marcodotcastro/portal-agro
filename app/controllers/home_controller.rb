class HomeController < ApplicationController
  layout "home"
  
  def index
    @produto = Produto.all.sample(1).first

    @produtos = Produto.all.sample(3)
    @servicos = Servico.all.sample(3)
    @produtores = Produtor.all.sample(3)
  end
end
