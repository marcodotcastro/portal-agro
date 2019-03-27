module ProdutoHelper

  def foto_capa_url(produto)
    # FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    produto.capa.attached? ? produto.capa : foto_vazia
  end

  def produto_preco_completo(produto)
    if produto.producoes.any?
      number_to_currency(produto.preco).to_s + " por " + Producao.human_enum_name(:medidas, produto.producoes.last.medida)
    else
      "Produção não cadastrada"
    end
  end

  def producao(produto)
    if produto.producoes.any?
      produto.producoes.last.numero.to_s + " " + Producao.human_enum_name(:medidas, produto.producoes.last.medida) + " por " + Producao.human_enum_name(:periodos, produto.producoes.last.periodo)
    end
  end

  def evolucao(produto)
    msg_producao = "nenhuma produção cadastrada"
    if produto.producoes.any?
      ultima_e_penultima = produto.producoes.last(2)

      alteracao = (((ultima_e_penultima.last.numero.to_f / ultima_e_penultima.first.numero.to_f) - 1) * 100).round(2)

      if alteracao >= 0
        msg_producao = "um aumento de #{alteracao}%"
      else
        msg_producao = "uma diminuição de #{alteracao * -1}%"
      end

    else
      msg_producao
    end
  end

  # TODO: Mover para model
  def visitas_ao_produto(produto)
    Ahoy::Event.where_props(produto_id: produto.id).count
  end

end
