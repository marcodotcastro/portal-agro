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

class Pedido < ApplicationRecord
  belongs_to :produto

  enum status: {
    novo: 0,
    em_contato: 1,
    concluido: 2,
    cancelado: 3
  }

  validates :nome, :contato, :produto, presence: true
  validates :quantidade, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
