# == Schema Information
#
# Table name: contatos
#
#  id         :bigint(8)        not null, primary key
#  descricao  :text
#  email      :string
#  nome       :string
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Contato, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
