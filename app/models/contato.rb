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

class Contato < ApplicationRecord
  validates :nome, :telefone, :email, presence: true
end
