# == Schema Information
#
# Table name: criacoes
#
#  id         :bigint(8)        not null, primary key
#  data       :datetime
#  descricao  :string
#  titulo     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  produto_id :bigint(8)
#
# Indexes
#
#  index_criacoes_on_produto_id  (produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (produto_id => produtos.id)
#

class Criacao < ApplicationRecord
  belongs_to :produto, optional: true

  validates :data, :descricao, :titulo, :produto_id, presence: true
end
