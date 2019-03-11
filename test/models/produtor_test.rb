# == Schema Information
#
# Table name: produtores
#
#  id         :bigint(8)        not null, primary key
#  apelido    :string
#  cartao     :boolean
#  email      :string
#  endereco   :string
#  nome       :string
#  slug       :string
#  sobrenome  :string
#  telefone   :string
#  whatsapp   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_produtores_on_slug  (slug) UNIQUE
#

require 'test_helper'

class ProdutorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
