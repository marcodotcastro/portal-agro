module ProdutorHelper

  def foto_perfil_url(produtor)
    #FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    produtor.perfil.attached? ? produtor.perfil : foto_vazia
  end

  def nome_completo(produtor)
    produtor.nome + " " + produtor.sobrenome
  end

  def endereco_completo(produtor)
    produtor.endereco + ", " + produtor.cidade.nome + ", " + produtor.cidade.estado.nome
  end

end
