# == Schema Information
#
# Table name: estados
#
#  id         :bigint(8)        not null, primary key
#  nome       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_estados_on_slug  (slug)
#

require 'rails_helper'

RSpec.describe Estado, type: :model do

  before(:all) do
    @estado = create(:estado)
  end

  it "um estado" do
    expect(@estado.nome).to eq("Goiás")
  end

end
