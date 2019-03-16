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

class ContatosController < ApplicationController

  def index
    respond_to do |format|
      format.html {redirect_to new_contato_path}
    end
  end

  def show
  end

  def new
    @contato = Contato.new
  end

  def create
    @contato = Contato.new(contato_params)

    respond_to do |format|
      if @contato.save
        format.html {redirect_to contato_enviado_path}
      else
        format.html {render :new}
      end
    end
  end

  private

  def contato_params
    params.require(:contato).permit(:nome, :telefone, :email, :descricao)
  end
end

