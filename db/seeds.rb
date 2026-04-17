puts "[seeds] ambiente: #{Rails.env}"

# Seed minimo para ambiente local: rapido e suficiente para fluxo do cliente.
def attach_if_missing(record, attachment_name, filename)
  attachment = record.public_send(attachment_name)
  return if attachment.attached?

  path = Rails.root.join("spec/imagens", filename)
  File.open(path) do |file|
    attachment.attach(io: file, filename: filename)
  end
end

puts "[seeds] admin"
admin = AdminUser.find_or_initialize_by(email: "admin@portalagro.com.br")
if admin.new_record?
  admin.password = "abc12345"
  admin.password_confirmation = "abc12345"
  admin.save!
end

puts "[seeds] catalogos"
animal = Categoria.find_or_create_by!(nome: "Animal") do |categoria|
  categoria.descricao = "Produtos de origem animal"
end

Categoria.find_or_create_by!(nome: "Vegetal") do |categoria|
  categoria.descricao = "Produtos de origem vegetal"
end

Categoria.find_or_create_by!(nome: "Industrial") do |categoria|
  categoria.descricao = "Produtos industrializados"
end

tradicional = Qualidade.find_or_create_by!(nome: "Tradicional") do |qualidade|
  qualidade.descricao = "Cultivo/criacao no modelo tradicional"
end

Qualidade.find_or_create_by!(nome: "Natural") do |qualidade|
  qualidade.descricao = "Sem selo organico"
end

Qualidade.find_or_create_by!(nome: "Orgânico") do |qualidade|
  qualidade.descricao = "Com selo organico"
end

puts "[seeds] localizacao"
estado = Estado.find_or_create_by!(nome: "Goiás")
cidade = Cidade.find_or_create_by!(nome: "Cocalzinho", estado: estado)

puts "[seeds] produtor"
produtor = Produtor.find_or_initialize_by(email: "jose.silva@gmail.com")
produtor.assign_attributes(
  nome: "Jose",
  sobrenome: "Silva",
  telefone: "(62) 99998-12345",
  endereco: "R 01, Bro 9 de Julho",
  apelido: "Ze",
  dap: true,
  pessoa_juridica: true,
  whatsapp: true,
  cartao: true,
  licenciamento_ambiental: :lp,
  published_at: 2.months.ago,
  cidade: cidade
)
attach_if_missing(produtor, :perfil, "jose-silva-perfil.jpg")
produtor.save!

puts "[seeds] produto"
produto = Produto.find_or_initialize_by(nome: "Leite", produtor: produtor)
produto.assign_attributes(
  descricao: "Leite fresco do produtor local.",
  preco: 1.50,
  selo_inspecao: :sim,
  published_at: 2.months.ago,
  categoria: animal,
  qualidade: tradicional
)
attach_if_missing(produto, :capa, "jose-silva-leite-capa.jpg")
produto.save!

puts "[seeds] servico"
servico = Servico.find_or_initialize_by(nome: "Aluguel de Trator", produtor: produtor)
servico.assign_attributes(
  descricao: "Servico de trator para preparo de area.",
  preco: 80.00,
  medida: :hora,
  published_at: 1.month.ago
)
attach_if_missing(servico, :capa, "celio-fleury-aluguel-trator-capa.jpg")
servico.save!

puts "[seeds] concluido - produtor, produto e servico prontos para navegacao do cliente"
