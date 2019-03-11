# == Schema Information
#
# Table name: producoes
#
#  id         :bigint(8)        not null, primary key
#  numero     :integer
#  periodo    :integer          default("dia")
#  unidade    :integer          default("unitario")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  produto_id :bigint(8)
#
# Indexes
#
#  index_producoes_on_produto_id  (produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (produto_id => produtos.id)
#

require 'test_helper'

class ProducaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
