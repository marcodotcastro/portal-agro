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

class ContatosController < InheritedResources::Base

  private

    def contato_params
      params.require(:contato).permit(:nome, :telefone, :email, :descricao)
    end
end

