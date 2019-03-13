# == Schema Information
#
# Table name: servicos
#
#  id          :bigint(8)        not null, primary key
#  descricao   :string
#  medida      :integer          default("hora")
#  nome        :string
#  preco       :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  produtor_id :bigint(8)
#
# Indexes
#
#  index_servicos_on_produtor_id  (produtor_id)
#  index_servicos_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (produtor_id => produtores.id)
#

require 'rails_helper'

RSpec.describe Servico, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
