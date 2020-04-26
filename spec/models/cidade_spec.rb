# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
#  nome       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  estado_id  :bigint(8)
#
# Indexes
#
#  index_cidades_on_estado_id  (estado_id)
#  index_cidades_on_slug       (slug)
#
# Foreign Keys
#
#  fk_rails_...  (estado_id => estados.id)
#

require 'rails_helper'

RSpec.describe Cidade, type: :model do

  before(:all) do
    @cidade = create(:cidade)
  end

  it "uma cidade" do
    expect(@cidade.nome).to eq("Corumbá de Goiás")
    expect(@cidade.estado.nome).to eq("Goiás")
  end

end
