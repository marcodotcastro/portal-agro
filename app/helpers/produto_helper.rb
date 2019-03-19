module ProdutoHelper

  def foto_capa_url(produto)
    #FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    produto.capa.attached? ? produto.capa : foto_vazia
  end

  def produto_preco_completo(produto)
    if produto.producoes
      number_to_currency(produto.preco).to_s + " por " + Producao.human_enum_name(:medidas, produto.producoes.last.medida)
    end
  end

  def producao(produto)
    if produto.producoes
      produto.producoes.last.numero.to_s + " " + Producao.human_enum_name(:medidas, produto.producoes.last.medida) + " por " + Producao.human_enum_name(:periodos, produto.producoes.last.periodo)
    end
  end

  def evolucao(produto)
    if produto.producoes
      ultima_e_penultima = produto.producoes.last(2)
      alteracao = (((ultima_e_penultima.last.numero.to_f / ultima_e_penultima.first.numero.to_f) - 1) * 100).round(2)

      if alteracao >= 0
        "um aumento de #{alteracao}%"
      else
        "uma diminuição de #{alteracao * -1}%"
      end

    end
  end

end
