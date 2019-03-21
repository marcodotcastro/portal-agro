puts Rails.env

puts "# Administrador"
AdminUser.first_or_create!(email: "admin@portalagro.com.br", password: "abc12345", password_confirmation: "abc12345")

puts "# Categoria"
animal = Categoria.create!(id: 1, nome: "Animal", descricao: "São os produtos de origem animal. Ex: Leite, frango, gado etc")
vegetal = Categoria.create!(id: 2, nome: "Vegetal", descricao: "São os produtos de origem vegetal. Ex: Tomate, soja, milho etc")
industrial = Categoria.create!(id: 3, nome: "Industrial", descricao: "São os produtos que foram transformados. Ex: Queijo, doces, bacon, etc")

puts "# Qualidade"
tradicional = Qualidade.create!(id: 1, nome: "Tradicional", descricao: "São produtos cultivados ou criados nas formas antigas, ou seja a base de herbicidas, agrotóxico e pesticida.")
natural = Qualidade.create!(id: 2, nome: "Natural", descricao: "São produtos cultivados ou criados nas formas novas, ou seja sem a base de herbicidas, agrotóxico e pesticida, e NÃO TEM o selo de orgânico")
organico = Qualidade.create!(id: 3, nome: "Orgânico", descricao: "São produtos cultivados ou criados nas formas novas, ou seja sem a base de herbicidas, agrotóxico e pesticida, e TEM o selo de orgânico")

puts "# Estado"
estado = Estado.create!(id: 1, nome: "Goiás")

puts "# Cidade"
cidade_corumba_de_goias = Cidade.create!(id: 1, nome: "Corumbá de Goiás", estado: estado)
cidade_cocalzinho = Cidade.create!(id: 2, nome: "Cocalzinho", estado: estado)

#if Rails.env.development?

puts "# Produtores e Produtos"

produtor_jose_silva = Produtor.new(
    nome: "José",
    sobrenome: "Silva",
    telefone: "(62) 99998-12345",
    email: "jose.silva@gmail.com",
    endereco: "R 01, Bro 9 de Julho",
    apelido: "Zé",
    dap: true,
    pessoa_juridica: true,
    whatsapp: true,
    cartao: true,
    licenciamento_ambiental: :lp,
    published_at: DateTime.now.prev_month(2),
    created_at: DateTime.now.prev_month(2)
)
produtor_jose_silva.perfil.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-perfil.jpg"), filename: "jose-silva-perfil.jpg")
produtor_jose_silva.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-foto-1.jpg"), filename: "jose-silva-foto-1.jpg")
produtor_jose_silva.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-foto-2.jpg"), filename: "jose-silva-foto-2.jpg")
produtor_jose_silva_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "Fdbk4v4a16Y")
produtor_jose_silva.video = produtor_jose_silva_video_1
produtor_jose_silva.cidade = cidade_cocalzinho
produtor_jose_silva.save!
produtor_jose_silva_historia_1 = Historia.new(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
produtor_jose_silva_historia_2 = Historia.new(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
produtor_jose_silva_historia_3 = Historia.new(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
produtor_jose_silva.historias << [produtor_jose_silva_historia_1, produtor_jose_silva_historia_2, produtor_jose_silva_historia_3]

puts "## #{produtor_jose_silva.nome}"

produtor_jose_silva_produto_leite = Produto.new(
    nome: "Leite",
    descricao: "O leite é ..., pois ...",
    preco: 1.50,
    selo_inspecao: :sim,
    published_at: DateTime.now.prev_month(2),
    created_at: DateTime.now.prev_month(2)
)
produtor_jose_silva_produto_leite_producao_1 = Producao.new(numero: 100, medida: :litro, periodo: :dia, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(2))
produtor_jose_silva_produto_leite_producao_2 = Producao.new(numero: 150, medida: :litro, periodo: :dia, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
produtor_jose_silva_produto_leite_producao_3 = Producao.new(numero: 250, medida: :litro, periodo: :dia, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))
produtor_jose_silva_produto_leite_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "XRgDSQJgoCI")
produtor_jose_silva_produto_leite.video = produtor_jose_silva_produto_leite_video_1
produtor_jose_silva_produto_leite.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-capa.jpg"), filename: "jose-silva-leite-capa.jpg")
produtor_jose_silva_produto_leite.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-foto-1.jpg"), filename: "jose-silva-leite-foto-1.jpg")
produtor_jose_silva_produto_leite.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-leite-foto-2.jpg"), filename: "jose-silva-leite-foto-2.jpg")
produtor_jose_silva_produto_leite.categoria = animal
produtor_jose_silva_produto_leite.qualidade = tradicional
produtor_jose_silva_produto_leite.produtor = produtor_jose_silva
produtor_jose_silva_produto_leite.save!
produtor_jose_silva_produto_leite.producoes << [produtor_jose_silva_produto_leite_producao_1, produtor_jose_silva_produto_leite_producao_2, produtor_jose_silva_produto_leite_producao_3]

puts "### #{produtor_jose_silva_produto_leite.nome}"

produtor_jose_silva_produto_bezerro = Produto.new(
    nome: "Bezerro",
    descricao: "O Vitelo, terneiro, bezerro ou novilho são ..., pois ...",
    preco: 1000.00,
    selo_inspecao: :sim,
    published_at: DateTime.now.prev_month(2),
    created_at: DateTime.now.prev_month(2)
)
produtor_jose_silva_produto_bezerro_producao_1 = Producao.new(numero: 10, medida: :unidade, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(2))
produtor_jose_silva_produto_bezerro_producao_2 = Producao.new(numero: 15, medida: :unidade, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
produtor_jose_silva_produto_bezerro_producao_3 = Producao.new(numero: 25, medida: :unidade, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))
produtor_jose_silva_produto_bezerro_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "tVs8EQ9bkUA")
produtor_jose_silva_produto_bezerro.video = produtor_jose_silva_produto_bezerro_video_1
produtor_jose_silva_produto_bezerro.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-bezerro-capa.jpg"), filename: "jose-silva-bezerro-capa.jpg")
produtor_jose_silva_produto_bezerro.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-bezerro-foto-1.jpg"), filename: "jose-silva-bezerro-foto-1.jpg")
produtor_jose_silva_produto_bezerro.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-bezerro-foto-2.jpg"), filename: "jose-silva-bezerro-foto-2.jpg")
produtor_jose_silva_produto_bezerro.categoria = animal
produtor_jose_silva_produto_bezerro.qualidade = tradicional
produtor_jose_silva_produto_bezerro.produtor = produtor_jose_silva
produtor_jose_silva_produto_bezerro.save!
produtor_jose_silva_produto_bezerro.producoes << [produtor_jose_silva_produto_bezerro_producao_1, produtor_jose_silva_produto_bezerro_producao_2, produtor_jose_silva_produto_bezerro_producao_3]

puts "### #{produtor_jose_silva_produto_bezerro.nome}"

produtor_jose_silva_produto_milho = Produto.new(
    nome: "Milho",
    descricao: "O milho é ..., pois ...",
    preco: 30.00,
    published_at: DateTime.now.prev_month(2),
    created_at: DateTime.now.prev_month(2)
)
produtor_jose_silva_produto_milho_producao_1 = Producao.new(numero: 100, medida: :saco, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(2))
produtor_jose_silva_produto_milho_producao_2 = Producao.new(numero: 150, medida: :saco, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
produtor_jose_silva_produto_milho_producao_3 = Producao.new(numero: 250, medida: :saco, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))
produtor_jose_silva_produto_milho_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "ki_hznmHIT8")
produtor_jose_silva_produto_milho.video = produtor_jose_silva_produto_milho_video_1
produtor_jose_silva_produto_milho.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-milho-capa.jpg"), filename: "jose-silva-milho-capa.jpg")
produtor_jose_silva_produto_milho.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-milho-foto-1.jpg"), filename: "jose-silva-milho-foto-1.jpg")
produtor_jose_silva_produto_milho.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-milho-foto-2.jpg"), filename: "jose-silva-milho-foto-2.jpg")
produtor_jose_silva_produto_milho.categoria = vegetal
produtor_jose_silva_produto_milho.qualidade = tradicional
produtor_jose_silva_produto_milho.produtor = produtor_jose_silva
produtor_jose_silva_produto_milho.save!
produtor_jose_silva_produto_milho.producoes << [produtor_jose_silva_produto_milho_producao_1, produtor_jose_silva_produto_milho_producao_2, produtor_jose_silva_produto_milho_producao_3]

puts "### #{produtor_jose_silva_produto_milho.nome}"

produtor_jose_silva_produto_pamonha = Produto.new(
    nome: "Pamonha",
    descricao: "A Pamonha é ..., pois ...",
    preco: 3.50,
    selo_inspecao: :sim,
    published_at: DateTime.now.prev_month(2),
    created_at: DateTime.now.prev_month(2)
)
produtor_jose_silva_produto_pamonha_producao_1 = Producao.new(numero: 100, medida: :unidade, periodo: :dia, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(2))
produtor_jose_silva_produto_pamonha_producao_2 = Producao.new(numero: 150, medida: :unidade, periodo: :dia, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
produtor_jose_silva_produto_pamonha_producao_3 = Producao.new(numero: 250, medida: :unidade, periodo: :dia, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))
produtor_jose_silva_produto_pamonha_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "MTUVNZOOnNw")
produtor_jose_silva_produto_pamonha.video = produtor_jose_silva_produto_pamonha_video_1
produtor_jose_silva_produto_pamonha.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-pamonha-capa.jpg"), filename: "jose-silva-pamonha-capa.jpg")
produtor_jose_silva_produto_pamonha.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-pamonha-foto-1.jpg"), filename: "jose-silva-pamonha-foto-1.jpg")
produtor_jose_silva_produto_pamonha.fotos.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-pamonha-foto-2.jpg"), filename: "jose-silva-pamonha-foto-2.jpg")
produtor_jose_silva_produto_pamonha.categoria = industrial
produtor_jose_silva_produto_pamonha.qualidade = tradicional
produtor_jose_silva_produto_pamonha.produtor = produtor_jose_silva
produtor_jose_silva_produto_pamonha.save!
produtor_jose_silva_produto_pamonha.producoes << [produtor_jose_silva_produto_pamonha_producao_1, produtor_jose_silva_produto_pamonha_producao_2, produtor_jose_silva_produto_pamonha_producao_3]

puts "### #{produtor_jose_silva_produto_pamonha.nome}"

produtor_divino_pereira = Produtor.new(
    nome: "Divino",
    sobrenome: "Pereira",
    telefone: "(62) 99998-12345",
    email: "divino.pereira@gmail.com",
    endereco: "R 02, Bro 9 de Julho",
    apelido: "Filho do Tião",
    dap: true,
    pessoa_juridica: false,
    whatsapp: false,
    cartao: false,
    licenciamento_ambiental: :lp,
    published_at: DateTime.now.prev_month(2),
    created_at: DateTime.now.prev_month(2)
)
produtor_divino_pereira_video_1 = Video.new(nome: "Video 2", descricao: "Video 2", codigo: "Uit7H-78XPI")
produtor_divino_pereira.perfil.attach(io: File.open(Rails.root + "spec/imagens/divino-pereira-perfil.jpg"), filename: "divino-pereira-perfil.jpg")
produtor_divino_pereira.video = produtor_divino_pereira_video_1
produtor_divino_pereira.cidade = cidade_cocalzinho
produtor_divino_pereira.save!

puts "## #{produtor_divino_pereira.nome}"

produtor_divino_pereira_produto_rocar = Servico.new(
    nome: "Roçar",
    descricao: "O roçar é ..., pois ...",
    preco: 40.00,
    medida: :dia,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_divino_pereira_produto_rocar.capa.attach(io: File.open(Rails.root + "spec/imagens/divino-pereira-roçar-capa.jpg"), filename: "divino-pereira-roçar-capa.jpg")
produtor_divino_pereira_produto_rocar.fotos.attach(io: File.open(Rails.root + "spec/imagens/divino-pereira-roçar-foto-1.jpg"), filename: "divino-pereira-roçar-foto-1.jpg")
produtor_divino_pereira_produto_rocar.fotos.attach(io: File.open(Rails.root + "spec/imagens/divino-pereira-roçar-foto-2.jpg"), filename: "divino-pereira-roçar-foto-2.jpg")
produtor_divino_pereira_produto_rocar.produtor = produtor_divino_pereira
produtor_divino_pereira_produto_rocar.save!

puts "### #{produtor_divino_pereira_produto_rocar.nome}"

produtor_stephan = Produtor.new(
    nome: "Stephan",
    sobrenome: "Gaehwiler",
    telefone: "(62) 99998-12345",
    email: "stephan.gaehwiler@gmail.com",
    endereco: "R 03, Bro 9 de Julho",
    apelido: "Suíço",
    dap: false,
    pessoa_juridica: true,
    whatsapp: false,
    cartao: true,
    licenciamento_ambiental: :li,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_stephan_historia_1 = Historia.new(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
produtor_stephan_historia_2 = Historia.new(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
produtor_stephan_historia_3 = Historia.new(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
produtor_stephan_video_1 = Video.new(nome: "Video 3", descricao: "Video 3", codigo: "cen9ZMYzUm0")
produtor_stephan.perfil.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-perfil.jpg"), filename: "stephan-gaehwiler-perfil.jpg")
produtor_stephan.cidade = cidade_corumba_de_goias
produtor_stephan.video = produtor_stephan_video_1
produtor_stephan.save!
produtor_stephan.historias << [produtor_stephan_historia_1, produtor_stephan_historia_2, produtor_stephan_historia_3]

puts "## #{produtor_stephan.nome}"

pprodutor_stephan_produto_queijo = Produto.new(
    nome: "Queijo",
    descricao: "O queijo é ..., pois ...",
    preco: 50.00,
    selo_inspecao: :sie,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
pprodutor_stephan_produto_queijo_producao_1 = Producao.new(numero: 100, medida: :unidade, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
pprodutor_stephan_produto_queijo_producao_2 = Producao.new(numero: 120, medida: :unidade, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))
pprodutor_stephan_produto_queijo_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8")
pprodutor_stephan_produto_queijo_criacao_1 = Criacao.new(data: Date.parse("Dec 8 2001"), titulo: "A criação", descricao: "Criado para atender ... foi transido pela família...")
pprodutor_stephan_produto_queijo_criacao_2 = Criacao.new(data: Date.parse("Dec 8 2002"), titulo: "A transformação", descricao: "Importou as vacas devido ... e perceber ...")
pprodutor_stephan_produto_queijo_criacao_3 = Criacao.new(data: Date.parse("Dec 8 2005"), titulo: "O sentimento", descricao: "Hoje seu sonho foi realizado, devido o prêmio ....")
pprodutor_stephan_produto_queijo.capa.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-capa.jpg"), filename: "stephan-gaehwiler-queijo-capa.jpg")
pprodutor_stephan_produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-1.jpg"), filename: "stephan-gaehwiler-queijo-foto-1.jpg")
pprodutor_stephan_produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-2.jpg"), filename: "stephan-gaehwiler-queijo-foto-2.jpg")
pprodutor_stephan_produto_queijo.fotos.attach(io: File.open(Rails.root + "spec/imagens/stephan-gaehwiler-queijo-foto-3.jpg"), filename: "stephan-gaehwiler-queijo-foto-3.jpg")
pprodutor_stephan_produto_queijo.video = pprodutor_stephan_produto_queijo_video_1
pprodutor_stephan_produto_queijo.categoria = industrial
pprodutor_stephan_produto_queijo.qualidade = organico
pprodutor_stephan_produto_queijo.produtor = produtor_stephan
pprodutor_stephan_produto_queijo.save!
pprodutor_stephan_produto_queijo.criacoes << [pprodutor_stephan_produto_queijo_criacao_1, pprodutor_stephan_produto_queijo_criacao_2, pprodutor_stephan_produto_queijo_criacao_3]
pprodutor_stephan_produto_queijo.producoes << [pprodutor_stephan_produto_queijo_producao_1, pprodutor_stephan_produto_queijo_producao_2]

puts "### #{pprodutor_stephan_produto_queijo.nome}"

produtor_maria_alves = Produtor.new(
    nome: "Maria",
    sobrenome: "Alves",
    telefone: "(62) 99998-12345",
    email: "maria.alves@gmail.com",
    endereco: "R 03, Bro 9 de Julho",
    apelido: "Mariazinha",
    dap: false,
    pessoa_juridica: false,
    whatsapp: false,
    cartao: true,
    licenciamento_ambiental: :lp,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_maria_alves.perfil.attach(io: File.open(Rails.root + "spec/imagens/maria-alves-perfil.jpg"), filename: "maria-alves-perfil.jpg")
produtor_maria_alves.fotos.attach(io: File.open(Rails.root + "spec/imagens/maria-alves-foto-1.jpg"), filename: "maria-alves-foto-1.jpg")
produtor_maria_alves.fotos.attach(io: File.open(Rails.root + "spec/imagens/maria-alves-foto-2.jpg"), filename: "maria-alves-foto-2.jpg")
produtor_maria_alves_historia_1 = Historia.new(data: Date.parse("Dec 8 1930"), titulo: "O Nascimento", descricao: "Nasceu na cidade de ... em uma casa com 12 irmão...")
produtor_maria_alves_historia_2 = Historia.new(data: Date.parse("Dec 8 1945"), titulo: "A Mudança", descricao: "Se mudou para ... devido ... e lá criou ...")
produtor_maria_alves_historia_3 = Historia.new(data: Date.parse("Dec 8 1955"), titulo: "A Compra", descricao: "Já com 2 filhos comprou sua primeira terra de 2 alqueires ....")
produtor_maria_alves_video_1 = Video.new(nome: "Video 3", descricao: "Video 3", codigo: "cen9ZMYzUm0")
produtor_maria_alves.video = produtor_maria_alves_video_1
produtor_maria_alves.cidade = cidade_corumba_de_goias
produtor_maria_alves.save!
produtor_maria_alves.historias << [produtor_maria_alves_historia_1, produtor_maria_alves_historia_2, produtor_maria_alves_historia_3]

puts "## #{produtor_maria_alves.nome}"

produtor_maria_alves_produto_soja = Produto.new(
    nome: "Soja",
    descricao: "A soja é ..., pois ...",
    preco: 60.00,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_maria_alves_produto_soja_producao_4 = Producao.new(numero: 500, medida: :saco, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
produtor_maria_alves_produto_soja_producao_5 = Producao.new(numero: 450, medida: :saco, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))
produtor_maria_alves_produto_soja_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8")
produtor_maria_alves_produto_soja.produtor = produtor_maria_alves
produtor_maria_alves_produto_soja.categoria = vegetal
produtor_maria_alves_produto_soja.qualidade = natural
produtor_maria_alves_produto_soja.video = produtor_maria_alves_produto_soja_video_1
produtor_maria_alves_produto_soja.capa.attach(io: File.open(Rails.root + "spec/imagens/jose-silva-soja-capa.jpg"), filename: "jose-silva-soja-capa.jpg")
produtor_maria_alves_produto_soja.save!
produtor_maria_alves_produto_soja.producoes << [produtor_maria_alves_produto_soja_producao_4, produtor_maria_alves_produto_soja_producao_5]

puts "### #{produtor_maria_alves_produto_soja.nome}"


produtor_celio_fleury = Produtor.new(
    nome: "Célio",
    sobrenome: "Fleury",
    telefone: "(62) 99998-12345",
    email: "celio.fleury@gmail.com",
    endereco: "Rua 1, Bairro Alto Boa Vista",
    apelido: "Prefeito",
    dap: false,
    pessoa_juridica: true,
    whatsapp: false,
    cartao: false,
    licenciamento_ambiental: :lo,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_celio_fleury_video_1 = Video.new(nome: "Video 2", descricao: "Video 2", codigo: "Uit7H-78XPI")
produtor_celio_fleury.perfil.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-perfil.jpg"), filename: "celio-fleury-perfil.jpg")
produtor_celio_fleury.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-foto-1.jpg"), filename: "celio-fleury-foto-1.jpg")
produtor_celio_fleury.video = produtor_celio_fleury_video_1
produtor_celio_fleury.cidade = cidade_corumba_de_goias
produtor_celio_fleury.save!

puts "## #{produtor_celio_fleury.nome}"

produtor_celio_fleury_produto_aluguel_pasto = Servico.new(
    nome: "Aluguel de Pasto",
    descricao: "O aluguel de pasto é ...., pois .....",
    preco: 25.00,
    medida: :cabeca,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_celio_fleury_produto_aluguel_pasto.capa.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-aluguel-pasto-capa.jpg"), filename: "celio-fleury-aluguel-pasto-capa.jpg")
produtor_celio_fleury_produto_aluguel_pasto.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-aluguel-pasto-foto-1.jpg"), filename: "celio-fleury-aluguel-pasto-foto-1.jpg")
produtor_celio_fleury_produto_aluguel_pasto.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-aluguel-pasto-foto-2.jpg"), filename: "celio-fleury-aluguel-pasto-foto-2.jpg")
produtor_celio_fleury_produto_aluguel_pasto.produtor = produtor_celio_fleury
produtor_celio_fleury_produto_aluguel_pasto.save!

puts "### #{produtor_celio_fleury_produto_aluguel_pasto.nome}"

produtor_celio_fleury_produto_aluguel_trator = Servico.new(
    nome: "Aluguel de Trator ",
    descricao: "O aluguel de trator é ...., pois .....",
    preco: 80.00,
    medida: :hora,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_celio_fleury_produto_aluguel_trator.capa.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-aluguel-trator-capa.jpg"), filename: "celio-fleury-aluguel-trator-capa.jpg")
produtor_celio_fleury_produto_aluguel_trator.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-aluguel-trator-foto-1.jpg"), filename: "celio-fleury-aluguel-trator-foto-1.jpg")
produtor_celio_fleury_produto_aluguel_trator.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-aluguel-trator-foto-2.jpg"), filename: "celio-fleury-aluguel-trator-foto-2.jpg")
produtor_celio_fleury_produto_aluguel_trator.produtor = produtor_celio_fleury
produtor_celio_fleury_produto_aluguel_trator.save!

puts "### #{produtor_celio_fleury_produto_aluguel_trator.nome}"

produtor_celio_fleury_produto_gado_corte = Produto.new(
    nome: "Gado de Corte",
    descricao: "O gado de corte é ..., pois ....",
    preco: 150.00,
    selo_inspecao: :sif,
    published_at: DateTime.now.prev_month(1),
    created_at: DateTime.now.prev_month(1)
)
produtor_celio_fleury_produto_gado_corte_producao_1 = Producao.new(numero: 100, medida: :arroba, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(1))
produtor_celio_fleury_produto_gado_corte_producao_2 = Producao.new(numero: 120, medida: :arroba, periodo: :ano, created_at: produtor_jose_silva_produto_leite.created_at.prev_month(0))

produtor_celio_fleury_produto_gado_corte_video_1 = Video.new(nome: "Video 1", descricao: "Video 1", codigo: "0FuZWc8Bpw8")
produtor_celio_fleury_produto_gado_corte_criacao_1 = Criacao.new(data: Date.parse("Dec 8 2001"), titulo: "A criação", descricao: "Criado para atender ... foi transido pela família...")
produtor_celio_fleury_produto_gado_corte_criacao_2 = Criacao.new(data: Date.parse("Dec 8 2002"), titulo: "A transformação", descricao: "Importou as vacas devido ... e perceber ...")
produtor_celio_fleury_produto_gado_corte_criacao_3 = Criacao.new(data: Date.parse("Dec 8 2005"), titulo: "O sentimento", descricao: "Hoje seu sonho foi realizado, devido o prêmio ....")
produtor_celio_fleury_produto_gado_corte.capa.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-gado-corte-capa.jpg"), filename: "celio-fleury-gado-corte-capa.jpg")
produtor_celio_fleury_produto_gado_corte.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-gado-corte-foto-1.jpg"), filename: "celio-fleury-gado-corte-foto-1.jpg")
produtor_celio_fleury_produto_gado_corte.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-gado-corte-foto-2.jpg"), filename: "celio-fleury-gado-corte-foto-2.jpg")
produtor_celio_fleury_produto_gado_corte.fotos.attach(io: File.open(Rails.root + "spec/imagens/celio-fleury-gado-corte-foto-3.jpg"), filename: "celio-fleury-gado-corte-foto-3.jpg")
produtor_celio_fleury_produto_gado_corte.video = produtor_celio_fleury_produto_gado_corte_video_1
produtor_celio_fleury_produto_gado_corte.categoria = animal
produtor_celio_fleury_produto_gado_corte.qualidade = tradicional
produtor_celio_fleury_produto_gado_corte.produtor = produtor_celio_fleury
produtor_celio_fleury_produto_gado_corte.save!
produtor_celio_fleury_produto_gado_corte.criacoes << [produtor_celio_fleury_produto_gado_corte_criacao_1, produtor_celio_fleury_produto_gado_corte_criacao_2, produtor_celio_fleury_produto_gado_corte_criacao_3]
produtor_celio_fleury_produto_gado_corte.producoes << [produtor_celio_fleury_produto_gado_corte_producao_1, produtor_celio_fleury_produto_gado_corte_producao_2]

puts "### #{produtor_celio_fleury_produto_gado_corte.nome}"

#end