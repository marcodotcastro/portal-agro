class PedidosController < ApplicationController
  before_action :set_produto

  def new
  end

  def create
    pedido_params
    flash.now[:notice] = "Recebemos os dados iniciais do seu pedido."
    render :new
  end

  private

  def set_produto
    produto_id = params[:produto_id].presence || params.dig(:pedido, :produto_id).presence

    if produto_id.blank?
      redirect_to produtos_path, alert: "Selecione um produto para iniciar o pedido."
      return
    end

    @produto = Produto.friendly.find(produto_id)
  rescue ActiveRecord::RecordNotFound
    redirect_to produtos_path, alert: "Produto não encontrado."
  end

  def pedido_params
    params.fetch(:pedido, {}).permit(:produto_id, :nome, :contato, :quantidade, :observacoes)
  end
end
