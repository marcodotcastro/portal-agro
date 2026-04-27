# == Schema Information
#
# Table name: pedidos
#
#  id          :bigint(8)        not null, primary key
#  contato     :string           not null
#  nome        :string           not null
#  observacoes :text
#  quantidade  :integer          not null
#  status      :integer          default("novo"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  produto_id  :bigint(8)        not null
#
# Indexes
#
#  index_pedidos_on_produto_id  (produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (produto_id => produtos.id)
#

class PedidosController < ApplicationController
  before_action :set_produto, only: [:new, :create]

  def index
    @pedidos = Pedido.includes(:produto).order(created_at: :desc)
  end

  def new
    @pedido ||= Pedido.new(produto: @produto)
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.produto = @produto

    if @pedido.save
      redirect_to new_pedido_path(produto_id: @produto), notice: "Pedido enviado com sucesso."
      return
    end

    flash.now[:alert] = "Revise os campos destacados."
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
