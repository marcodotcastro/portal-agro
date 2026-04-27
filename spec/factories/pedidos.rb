FactoryBot.define do
  factory :pedido do
    produto
    nome { "Comprador Teste" }
    contato { "61999990000" }
    quantidade { 1 }
    observacoes { "Observacao de teste" }
    status { :novo }
  end
end
