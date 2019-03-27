module ServicoHelper

  def foto_capa_url(servico)
    # FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    if servico
      servico.capa.attached? ? servico.capa : foto_vazia
    end
  end

  def servico_preco_completo(servico)
    number_to_currency(servico.preco).to_s + " por " + Servico.human_enum_name(:medidas, servico.medida)
  end

  def visitas_ao_servico(servico)
    Ahoy::Event.where_props(servico_id: servico.id).count
  end

end
