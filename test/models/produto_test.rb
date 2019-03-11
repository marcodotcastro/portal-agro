# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  nome         :string
#  preco        :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  categoria_id :bigint(8)
#  produtor_id  :bigint(8)
#  qualidade_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_categoria_id  (categoria_id)
#  index_produtos_on_produtor_id   (produtor_id)
#  index_produtos_on_qualidade_id  (qualidade_id)
#  index_produtos_on_slug          (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (categoria_id => categorias.id)
#  fk_rails_...  (produtor_id => produtores.id)
#  fk_rails_...  (qualidade_id => qualidades.id)
#

require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
