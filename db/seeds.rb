puts "[seeds] Starting Portal Agro seed data in #{Rails.env}..."

puts "[seeds] Admin User..."
admin = AdminUser.find_or_initialize_by(email: "admin@portalagro.com.br")
if admin.new_record?
  admin.password = "abc12345"
  admin.password_confirmation = "abc12345"
  admin.save!
end

puts "[seeds] States and Cities..."
goias = State.find_or_create_by!(name: "Goiás")
matogrosso = State.find_or_create_by!(name: "Mato Grosso")
minas = State.find_or_create_by!(name: "Minas Gerais")

rio_verde = City.find_or_create_by!(name: "Rio Verde", state: goias)
jatai = City.find_or_create_by!(name: "Jataí", state: goias)
cocalzinho = City.find_or_create_by!(name: "Cocalzinho de Goiás", state: goias)
sorriso = City.find_or_create_by!(name: "Sorriso", state: matogrosso)
uberlandia = City.find_or_create_by!(name: "Uberlândia", state: minas)

puts "[seeds] Categories and Qualities..."
cat_graos = Category.find_or_create_by!(name: "Grãos e Cereais") { |c| c.description = "Soja, milho, sorgo e trigo de alta produtividade" }
cat_hortifruti = Category.find_or_create_by!(name: "Hortifrúti e Olericultura") { |c| c.description = "Tomate, batata, cebola e legumes frescos" }
cat_pecuaria = Category.find_or_create_by!(name: "Pecuária e Laticínios") { |c| c.description = "Bovinos de corte, leite tipo A e derivados artesanais" }
cat_cafe = Category.find_or_create_by!(name: "Cafés Especiais") { |c| c.description = "Café arábica de altitude e microlotes certificados" }

q_organico = Quality.find_or_create_by!(name: "Orgânico Certificado") { |q| q.description = "Sem agrotóxicos com certificação IBD / Ecocert" }
q_exportacao = Quality.find_or_create_by!(name: "Padrão Exportação") { |q| q.description = "Classificação tipo 1 superior para indústria e exportação" }
q_tradicional = Quality.find_or_create_by!(name: "Convencional Sustentável") { |q| q.description = "Manejo integrado com rastreabilidade cooperativa" }

puts "[seeds] Producers..."
p1 = Producer.find_or_initialize_by(email: "contato@boavista.agr.br")
p1.assign_attributes(
  name: "Fazenda Boa Vista",
  nickname: "Agro Boa Vista",
  last_name: "Oliveira & Filhos",
  phone: "(64) 99823-1100",
  address: "Rodovia GO-174, Km 18, Zona Rural",
  city: rio_verde,
  legal_entity: true,
  accepts_card: true,
  environmental_license: :lo,
  published_at: Time.current
)
p1.save!

p2 = Producer.find_or_initialize_by(email: "sitio.esperanca@gmail.com")
p2.assign_attributes(
  name: "Sítio Nova Esperança",
  nickname: "Dona Maria da Horta",
  last_name: "Silva Ferreira",
  phone: "(62) 98744-5522",
  address: "Estrada dos Pireneus, Km 04",
  city: cocalzinho,
  legal_entity: false,
  accepts_card: false,
  environmental_license: :li,
  published_at: Time.current
)
p2.save!

p3 = Producer.find_or_initialize_by(email: "fazenda.cerradodourado@agr.br")
p3.assign_attributes(
  name: "Fazenda Cerrado Dourado",
  nickname: "Cerrado Dourado",
  last_name: "Guimarães Agro",
  phone: "(64) 99655-8899",
  address: "BR-060, Km 140, Zona Sul",
  city: jatai,
  legal_entity: true,
  accepts_card: true,
  environmental_license: :lo,
  published_at: Time.current
)
p3.save!

puts "[seeds] Products & Harvests..."
prod1 = Product.find_or_initialize_by(name: "Soja Grão Convencional - Safra 2026", producer: p1)
prod1.assign_attributes(
  price: 138.50,
  category: cat_graos,
  quality: q_exportacao,
  description: "Soja padrão tipo 1, umidade máxima 14%, impurezas até 1%. Lote armazenado em silo cooperativo.",
  inspection_seal: :sif,
  published_at: Time.current
)
prod1.save!
Harvest.find_or_create_by!(product: prod1, period: :annual) { |h| h.amount = 12000; h.unit = :sack }

prod2 = Product.find_or_initialize_by(name: "Milho Híbrido Safrinha", producer: p3)
prod2.assign_attributes(
  price: 74.00,
  category: cat_graos,
  quality: q_tradicional,
  description: "Milho safrinha alta sanidade para nutrição animal e rações concentradas.",
  inspection_seal: :sie,
  published_at: Time.current
)
prod2.save!
Harvest.find_or_create_by!(product: prod2, period: :seasonal) { |h| h.amount = 8500; h.unit = :sack }

prod3 = Product.find_or_initialize_by(name: "Tomate Italiano Agroecológico", producer: p2)
prod3.assign_attributes(
  price: 65.00,
  category: cat_hortifruti,
  quality: q_organico,
  description: "Tomate selecionado manualmente em estufa protegida sem defensivos químicos.",
  inspection_seal: :sim,
  published_at: Time.current
)
prod3.save!

prod4 = Product.find_or_initialize_by(name: "Café Arábica Cereja Descascado", producer: p1)
prod4.assign_attributes(
  price: 890.00,
  category: cat_cafe,
  quality: q_organico,
  description: "Microlote especial com pontuação SCA 86, notas de chocolate e rapadura.",
  inspection_seal: :sif,
  published_at: Time.current
)
prod4.save!

puts "[seeds] Services..."
Service.find_or_create_by!(name: "Análise e Correção de Solo por GPS", producer: p1) do |s|
  s.price = 180.00
  s.unit = "hectare"
  s.description = "Mapeamento de fertilidade por grade amostral com taxa variável."
end

Service.find_or_create_by!(name: "Colheita Mecanizada com Telemetria", producer: p3) do |s|
  s.price = 260.00
  s.unit = "hectare"
  s.description = "Frota de colheitadeiras modernas com monitoramento de perdas e umidade em tempo real."
end

puts "[seeds] Orders & Quotation Simulations..."
Order.find_or_create_by!(customer_name: "Cerealista São Bento Ltda", product: prod1) do |o|
  o.customer_contact = "compras@saobento.com.br / (64) 3621-9900"
  o.quantity = 500
  o.notes = "Cotação com retirada direta no silo cooperativo de Rio Verde."
  o.status = :contacted
end

Order.find_or_create_by!(customer_name: "Nutrição Animal Planalto", product: prod2) do |o|
  o.customer_contact = "(62) 99122-3344"
  o.quantity = 250
  o.notes = "Entrega fracionada em fábrica de ração durante 3 semanas."
  o.status = :new_order
end

puts "[seeds] Seeding completed cleanly with modern English schema!"
