# == Schema Information
#
# Table name: historias
#
#  id          :bigint(8)        not null, primary key
#  data        :datetime
#  descricao   :string
#  titulo      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  produtor_id :bigint(8)
#
# Indexes
#
#  index_historias_on_produtor_id  (produtor_id)
#
# Foreign Keys
#
#  fk_rails_...  (produtor_id => produtores.id)
#

require 'test_helper'

class HistoriaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
